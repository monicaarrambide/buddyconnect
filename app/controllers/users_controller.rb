class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)

        # generates random groupId for each officer
        if @user.isOfficer == true
          create_params = user_params
          create_params[:groupId] = SecureRandom.uuid
          @user.update(create_params)
        end
        
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # will calculate affinity between officers and students and match them accordingly
  def affinity_matching

    officerList = []
    studList = []
    affinities = []
    groups = []
    
    # Sorting officers and members into respective lists from user table
    User.all.each do |student|
      if not student.isOfficer and not student.isAdmin
        studList.append(student.studentId)
      elsif student.isOfficer
        officerList.append(student.studentId)
        groups.append([])
      end
    end


    for i in officerList  
      officer = []

      for j in studList
        affinityScore = 0
        # score for potential roles
        # this will have multiple answers (up to 3)
        officerQ1 = Interest.where(userId: i).pluck(:potentialRoles)
        studQ1 = Interest.where(userId: j).pluck(:potentialRoles)

        puts "IM RIGHT HEREE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts officerQ1
        puts studQ1

        if officerQ1 == studQ1
          affinityScore += 10
        end

        # score for past job experience
        # this will have multiple answers (up to 3)
        officerQ2 = Interest.where(userId: i).pluck(:pastWorkExp)
        studQ2 = Interest.where(userId: j).pluck(:pastWorkExp)

        if officerQ2 == studQ2
          affinityScore += 5
        end

        # score for years of experience
        officerQ3 = Interest.where(userId: i).pluck(:numWorkExp)
        studQ3 = Interest.where(userId: j).pluck(:numWorkExp)

        if officerQ3 == studQ3
          affinityScore += 2
        end

        # score for technologies worked on
        # this will have multiple answers (did not specify how many they can select)
        officerQ4 = Interest.where(userId: i).pluck(:usedTech)
        studQ4 = Interest.where(userId: j).pluck(:usedTech)

        if officerQ4 == studQ4
          affinityScore += 2
        end

        # score for state
        officerQ5 = Interest.where(userId: i).pluck(:state)
        studQ5 = Interest.where(userId: j).pluck(:state)

        if officerQ5 == studQ5
          affinityScore += 1
        end

        # score for community
        officerQ6 = Interest.where(userId: i).pluck(:community)
        studQ6 = Interest.where(userId: j).pluck(:community)

        if officerQ6 == studQ6
          affinityScore += 1
        end

        puts affinityScore

        # append affinity score for each student
        officer.append(affinityScore)
      end

      affinities.append(officer)
    end


    # All affinities calculated!
    # officer index 0 = officerList index 0
    puts affinities.inspect()


    # Sorting members based on affinity scores

    sID = 0
    topOfficer = 0
    maxGroupSize = (studList.length/officerList.length.to_f).ceil

    puts maxGroupSize
    

    for i in 0 ... studList.size
      highestAff = -1
      for j in 0 ... officerList.size

        # if the studnt officer affinity is the greatest or if the affinity is equal, then the student is put in the group with less people
        if ((affinities[j][i] > highestAff and groups[j].length < maxGroupSize) or (affinities[j][i] == highestAff and groups[j].length < groups[topOfficer].length))
          highestAff = affinities[j][i]
          topOfficer = j
          sID = i
        end

      end
      groups[topOfficer].append(studList[sID]);
      
    end
    [['Software Engineering'], ['Data Analytics']]
    # update students groupId
    puts groups.inspect()

    for j in 0 ... groups.size
      officerId = officerList[j]
      # get the officers groupID
      gID = User.where(studentId: officerId).pluck(:groupId)
      for stude in groups[j]
        # find student by ID in user table
        # add group id to users database
        User.where(studentId: stude).update_all(:groupId  => gID.first) 
      end
    end


    # confirm that matching worked
    respond_to do |format|
      format.html { redirect_to users_url, notice: "Function called: We matched! yay!" }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id].nil?
        @user = User.find_or_create_by!(tamuEmail: current_user.tamuEmail)
      else
        @user = User.find_by(tamuEmail: current_user.tamuEmail)
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:studentId, :groupId, :insterestsId, :profileId, :isOfficer, :isAdmin, :firstName, :lastName, :tamuEmail, :dateOfBirth, :gradAssistance)
    end
end
