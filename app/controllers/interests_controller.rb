class InterestsController < ApplicationController
  before_action :set_interest, only: %i[ show edit update destroy ]

  # GET /interests or /interests.json
  def index
    @interests = Interest.all
  end

  # GET /interests/1 or /interests/1.json
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end

  # POST /interests or /interests.json
  def create
    temp_params = interest_params
    puts temp_params
    if temp_params[:biography].present?
      temp_params.delete :biography
    end

    @interest = Interest.new(temp_params)
    if interest_params[:biography].present?
      create_bio_params = {
        :userId => current_user.studentId,
        :description => interest_params[:biography],
      }
      Biography.create(create_bio_params)
    end
    respond_to do |format|
      if @interest.save
        format.html { redirect_to interest_url(@interest.userId), notice: "Interest was successfully created." }
        format.json { render :show, status: :created, location: interest_path(@interest.studentId) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interests/1 or /interests/1.json
  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to interest_url(@interest), notice: "Interest was successfully updated." }
        format.json { render :show, status: :ok, location: @interest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interests/1 or /interests/1.json
  def destroy
    @interest.destroy

    respond_to do |format|
      format.html { redirect_to interests_url, notice: "Interest was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      # params[:id] should be studentId
      @interest = Interest.find_by(userId: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interest_params
      params.require(:interest).permit(:userId, :biography, :phone, :nationality, :state, :community, :numPrereqs, :scholarship, :faveMovieGenre, :numWorkExp, :usedTech, :projects, :extracurric, pastWorkExp:[], potentialRoles:[])
    end
end
