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
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  
    #params[:user].save

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
    #   if @group.update(user_id: group_params['user_id'])
    #     format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
    #     format.json { render :show, status: :ok, location: @group }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @group.errors, status: :unprocessable_entity }
    #   end
    # end

    #puts params
    #Ideally: Pass in user and group id as params, do user.find(param[:userId]).groupId = params[:groupID] and save this
    #params[:user].groupId = @group.groupId
    if params[:group][:user_id].present?
      tempUser = User.find_by(studentId: params[:group][:user_id])
      if(tempUser.groupId == @group.groupId) 
        tempUser.groupId = 0
        tempUser.save
      else
        tempUser.groupId = @group.groupId
        tempUser.save
      end
      format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
      format.json { render :show, status: :ok, location: @group }
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
    format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
    format.json { render :show, status: :ok, location: @group }
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

      # the group is created with the groupId and leaderInt since group num doesn't exist without officer
      lInt = User.where(groupId: current_user.groupId, isOfficer: true).pluck(:studentId).first
      @group = Group.find_or_create_by!(groupId: current_user.groupId, leaderInt: lInt)
      #end
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:groupId, :leaderInt, :studentId, :user_id, :remove_users)
    end
end
