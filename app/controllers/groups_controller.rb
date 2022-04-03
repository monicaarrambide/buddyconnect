class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
    @users = User.all
  end

  # GET /groups/1 or /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find_by(groupId: params[:id])
  end

  # POST /groups or /groups.json
  def create
    puts "CREATE"
    @group = Group.new(group_params)
    #@group = group_params
    respond_to do |format|
      if @group.save
        format.html { redirect_to group_path(@group.groupId), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group.groupId }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: (@group.groupId).errors, status: :unprocessable_entity }
      end
    end
  end

  
    #params[:user].save

  # PATCH/PUT /groups/1 or /groups/1.json
  def update

    # respond_to do |format|
    #   @group = Group.find_by(groupId: params[:group][:groupId])
    #   puts params
    #   if @group.update(leaderInt: params[:group][:leaderInt])
    #     format.html { redirect_to group_url(@group.groupId), notice: "Group was successfully updated." }
    #     format.json { render :show, status: :ok, location: @group.groupId }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @group.errors, status: :unprocessable_entity }
    #   end
    # end

    #puts params
    #Ideally: Pass in user and group id as params, do user.find(param[:userId]).groupId = params[:groupID] and save this
    #params[:user].groupId = @group.groupId
    respond_to do |format|
      puts "Here"
      puts params[:group]
      if params[:group][:user_id].nil? and params[:group][:remove_users].nil?
        tempParams = params
        tempParams[:id] = params[:group][:groupId]
        
        # Changing the group id for the old leader
        oldLeader = User.find_by(groupId: params[:group][:groupId], isOfficer: true)
        oldLeader.groupId = -1
        oldLeader.save

        # Changing the group id for the new leader
        newLeader = User.find_by(studentId: params[:group][:leaderInt])
        newLeader.groupId = tempParams[:id]
        newLeader.save

        puts "These"
        puts group_params
        # tempParams = params
        # tempParams[:id] = params[:group][:groupId]
        puts "Param ID"
        puts tempParams[:id]
        # @group.groupId = params[:group][:groupId]
        # @group.leaderInt = params[:group][:leaderInt]
        # @group.save
        format.html { redirect_to group_url(tempParams[:id]), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: group_path(tempParams[:id]) }
        # if @group.update(groupId: params[:group][:groupId], leaderInt: params[:group][:leaderInt])
        #   format.html { redirect_to group_url(@group.groupId), notice: "Group was successfully updated." }
        #   format.json { render :show, status: :ok, location: group_path(@group.groupId) }
        # end
      end

      if params[:group][:user_id].present?
        tempUser = User.find_by(studentId: params[:group][:user_id])
        if(tempUser.groupId == @group.groupId) 
          tempUser.groupId = 0
          tempUser.save
        else
          tempUser.groupId = @group.groupId
          tempUser.save
        end
        if @group.update(groupId: params[:group][:groupId], leaderInt: params[:group][:leaderInt])
          format.html { redirect_to group_url(@group.groupId), notice: "Group was successfully updated." }
          format.json { render :show, status: :ok, location: group_path(@group.groupId) }
        end
      end

      if params[:group][:remove_users].present?
        tempUser = User.find_by(studentId: params[:group][:remove_users])
        if(tempUser.groupId == @group.groupId) 
          tempUser.groupId = 0
          tempUser.save
        else
          tempUser.groupId = @group.groupId
          tempUser.save
        end
        format.html { redirect_to group_url(@group.groupId), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: group_path(@group.groupId) }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def change_users
      #puts params
      #Ideally: Pass in user and group id as params, do user.find(param[:userId]).groupId = params[:groupID] and save this
      params[:user].groupId = @group.groupId
      params[:user].save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      # TO DO: Can this be added to the model instead??
      # params[:id] is groupId
      # the group is created with the groupId and leaderInt since group num doesn't exist without officer
      #puts params
      lInt = User.where(groupId: params[:id], isOfficer: true).pluck(:studentId).first
      puts "PARAMS"
      puts params
      if params[:group].present? 
        @group = Group.find_by(groupId: params[:group][:groupId])
      else
        @group = Group.find_or_create_by!(groupId: params[:id])
        @group.leaderInt = lInt
        @group.save
      end
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:groupId, :leaderInt, :studentId, :user_id, :remove_users)
    end
end
