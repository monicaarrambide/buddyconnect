# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    # admins can see everyone while buddies only see officers/admins
    @users = if current_user.isAdmin
               User.all
             else
               User.where(isOfficer: true)
             end
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    create_params = user_params
    create_params[:studentId] = SecureRandom.uuid
    if create_params[:isOfficer] == false
      create_params[:groupId] = -1
    end
    create_params[:avatarUrl] = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png'

    @user = User.new(create_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to(user_url(@user.studentId), notice: 'User was successfully created.') }
        format.json { render(:show, status: :created, location: user_path(@user.studentId)) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @user.studentId.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      # checks if user wasn't a previous officer
      # avoids changing groupId every time info is updated
      # puts params[:user][:studentId]

      # TO DO: change if we will allow users to change ids - breaks otherwise
      @user = User.find_by(studentId: params[:user][:studentId])

      changeGroup = false
      changeGroup = true unless @user.isOfficer

      if @user.update(user_params)

        # generates random groupId for each new officer
        if (@user.isOfficer == true) && changeGroup
          create_params = user_params
          gId = SecureRandom.uuid

          # ensures there's not two groups with the same id
          gId = SecureRandom.uuid while Group.find_by(groupId: gId).present?
          create_params[:groupId] = gId
          @user.update!(create_params)
        end

        format.html { redirect_to(user_url(@user.studentId), notice: 'User was successfully updated.') }
        format.json { render(:show, status: :ok, location: user_path(@user.studentId)) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    Rails.logger.debug('Destroy')
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to(users_url, notice: 'User was successfully destroyed.') }
      format.json { head(:no_content) }
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
      if !student.isOfficer && !student.isAdmin
        studList.append(student.studentId)
      elsif student.isOfficer
        officerList.append(student.studentId)
        groups.append([])
      end
    end

    officerList.each do |i|
      officer = []
      prOfficer = []
      prStud = []
      peOfficer = []
      techOfficer = []
      peStud = []
      techStud = []

      studList.each do |j|
        affinityScore = 0
        # score for potential roles
        # this will have multiple answers (up to 3)

        if Interest.exists?(userId: i)
          officerQ1 = Interest.where(userId: i).pick(:potentialRoles).to_str
          prOfficer = officerQ1.split(',')

          officerQ2 = Interest.where(userId: i).pick(:pastWorkExp).to_str
          peOfficer = officerQ2.split(',')

          officerQ4 = Interest.where(userId: i).pick(:usedTech).to_str
          techOfficer = officerQ4.split(',')
        else
          officerQ1 = Interest.where(userId: i).pick(:potentialRoles)
        end

        # turning potential roles into array for student and officers
        # prOfficer = officerQ1.split(",")
        # puts "Officer pr array AFTER split:"
        Rails.logger.debug(prOfficer)

        if Interest.exists?(userId: j)
          studQ1 = Interest.where(userId: j).pick(:potentialRoles).to_str
          prStud = studQ1.split(',')

          studQ2 = Interest.where(userId: j).pick(:pastWorkExp).to_str
          peStud = studQ2.split(',')

          studQ4 = Interest.where(userId: j).pick(:usedTech).to_str
          techStud = studQ4.split(',')
        else
          studQ1 = Interest.where(userId: j).pick(:potentialRoles)
        end

        # prStud = studQ1.split(",")
        # puts "Sutdent pr array:"
        Rails.logger.debug(prStud)

        # a = [1,2,3,4,5]
        # a.include?(3)   # => true
        # a.include?(9)   # => false

        if prStud.size < prOfficer.size
          prStud.each do |k|
            # puts "This is my current k: "
            # puts k.strip
            if (k.strip).in?(officerQ1)
              Rails.logger.debug('Potential Role MATCH')
              affinityScore += 10
            end
          end
        else
          prOfficer.each do |k|
            # puts "Officer - This is my current k: "
            # puts k.strip
            if (k.strip).in?(studQ1)
              # puts "Potential role MATCH"
              affinityScore += 10
            end
          end
        end

        # score for past job experience
        # this will have multiple answers (up to 3)
        # officerQ2 = Interest.where(userId: i).pluck(:pastWorkExp).first.to_str
        # studQ2 = Interest.where(userId: j).pluck(:pastWorkExp).first.to_str

        # peOfficer = officerQ2.split(",");
        # peStud = studQ2.split(",");

        if peStud.size < peOfficer.size
          peStud.each do |k|
            # puts "This is my current k: "
            # puts k.strip
            next unless (k.strip).in?(officerQ2)

            # puts "Past experience MATCH"
            affinityScore += 5
            # puts affinityScore
          end
        else
          peOfficer.each do |k|
            # puts "Officer - This is my current k: "
            # puts k.strip
            next unless (k.strip).in?(studQ2)

            # puts "Past experience MATCH"
            affinityScore += 5
            # puts affinityScore
          end
        end

        # score for years of experience
        officerQ3 = Interest.where(userId: i).pluck(:numWorkExp)
        studQ3 = Interest.where(userId: j).pluck(:numWorkExp)

        if officerQ3 == studQ3
          Rails.logger.debug('Years MATCH')
          affinityScore += 2
        end

        # score for technologies worked on
        # this will have multiple answers (did not specify how many they can select)
        # officerQ4 = Interest.where(userId: i).pluck(:usedTech).first.to_str
        # studQ4 = Interest.where(userId: j).pluck(:usedTech).first.to_str

        # techOfficer = officerQ4.split(",");
        # techStud = studQ4.split(",");

        # puts techStud
        if techStud.size < techOfficer.size
          techStud.each do |k|
            # puts "This is my current k: "
            # puts k.strip
            next unless (k.strip).in?(officerQ4)

            # if techOfficer.include?(k.strip)
            Rails.logger.debug('Technologies MATCH')
            affinityScore += 2
            # puts affinityScore
          end
        else
          techOfficer.each do |k|
            # puts "Officer - This is my current k: "
            # puts k.strip
            next unless (k.strip).in?(studQ4)

            # if techStud.include?(k.strip)
            Rails.logger.debug('Technologies MATCH')
            affinityScore += 2
            # puts affinityScore
          end
        end

        # score for state
        officerQ5 = Interest.where(userId: i).pluck(:state)
        studQ5 = Interest.where(userId: j).pluck(:state)

        if officerQ5 == studQ5
          Rails.logger.debug('State MATCH')
          affinityScore += 1
        end

        # score for community
        officerQ6 = Interest.where(userId: i).pluck(:community)
        studQ6 = Interest.where(userId: j).pluck(:community)

        if officerQ6 == studQ6
          Rails.logger.debug('Community MATCH')
          affinityScore += 1
        end

        # append affinity score for each student
        officer.append(affinityScore)
      end

      affinities.append(officer)
    end

    # All affinities calculated!
    # officer index 0 = officerList index 0
    Rails.logger.debug('Affinities scores')
    Rails.logger.debug(affinities.inspect)

    # Sorting members based on affinity scores

    sID = 0
    topOfficer = 0
    maxGroupSize = (studList.length / Float(officerList.length)).ceil

    Rails.logger.debug(maxGroupSize)

    (0...studList.size).each do |i|
      highestAff = -1
      (0...officerList.size).each do |j|
        # if the studnt officer affinity is the greatest or if the affinity is equal, then the student is put in the group with less people
        unless ((affinities[j][i] > highestAff) && (groups[j].length < maxGroupSize)) || ((affinities[j][i] == highestAff) && (groups[j].length < groups[topOfficer].length))
          next
        end

        highestAff = affinities[j][i]
        topOfficer = j
        sID = i
      end
      groups[topOfficer].append(studList[sID])
    end
    [['Software Engineering'], ['Data Analytics']]
    # update students groupId
    Rails.logger.debug(groups.inspect)

    (0...groups.size).each do |j|
      officerId = officerList[j]
      # get the officers groupID
      gID = User.where(studentId: officerId).pluck(:groupId)
      groups[j].each do |stude|
        # find student by ID in user table
        # add group id to users database
        User.where(studentId: stude).update_all(groupId: gID.first)
      end
    end

    # confirm that matching worked
    respond_to do |format|
      format.html { redirect_to(users_url, notice: 'Function called: We matched! yay!') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = if params[:id].nil?
              User.find_or_create_by!(tamuEmail: current_user.tamuEmail)
            else
              User.find_by(studentId: params[:id])
            end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:studentId, :groupId, :insterestsId, :profileId, :isOfficer, :isAdmin, :fullName, :avatarUrl, :tamuEmail,
                                 :dateOfBirth, :gradAssistance
    )
  end
end
