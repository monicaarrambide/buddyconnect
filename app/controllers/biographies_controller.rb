# frozen_string_literal: true

class BiographiesController < ApplicationController
  before_action :set_biography, only: %i[show edit update destroy]

  # GET /biographies or /biographies.json
  def index
    @biographies = Biography.all
  end

  # GET /biographies/1 or /biographies/1.json
  def show; end

  # GET /biographies/new
  def new
    @biography = Biography.new
  end

  # GET /biographies/1/edit
  def edit; end

  # POST /biographies or /biographies.json
  def create
    @biography = Biography.new(biography_params)

    respond_to do |format|
      if @biography.save
        format.html { redirect_to(biography_url(@biography), notice: 'Biography was successfully created.') }
        format.json { render(:show, status: :created, location: @biography) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @biography.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /biographies/1 or /biographies/1.json
  def update
    respond_to do |format|
      if @biography.update(biography_params)
        format.html { redirect_to(biography_url(@biography), notice: 'Biography was successfully updated.') }
        format.json { render(:show, status: :ok, location: @biography) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @biography.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /biographies/1 or /biographies/1.json
  def destroy
    @biography.destroy!

    respond_to do |format|
      format.html { redirect_to(biographies_url, notice: 'Biography was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_biography
    @biography = Biography.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def biography_params
    params.require(:biography).permit(:userId, :description)
  end
end
