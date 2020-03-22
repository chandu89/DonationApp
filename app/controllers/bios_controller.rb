class BiosController < ApplicationController
  before_action :set_bio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bios
  # GET /bios.json
  def index
    @bios = current_user.bios.all
    render :json => @bios
  end

  # GET /bios/1
  # GET /bios/1.json
  def show
  end

  # GET /bios/new
  def new
    @bio = current_user.bios.new
  end

  # GET /bios/1/edit
  def edit
  end

  # POST /bios
  # POST /bios.json
  def create
    @bio = current_user.bios.new(bio_params)

    respond_to do |format|
      if @bio.save
        format.html { redirect_to @bio, notice: 'Bio was successfully created.' }
        format.json { render :show, status: :created, location: @bio }
      else
        format.html { render :new }
        format.json { render json: @bio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bios/1
  # PATCH/PUT /bios/1.json
  def update
    respond_to do |format|
      if @bio.update(bio_params)
        format.html { redirect_to @bio, notice: 'Bio was successfully updated.' }
        format.json { render :show, status: :ok, location: @bio }
      else
        format.html { render :edit }
        format.json { render json: @bio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bios/1
  # DELETE /bios/1.json
  def destroy
    @bio.destroy
    respond_to do |format|
      format.html { redirect_to bios_url, notice: 'Bio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bio
      @bio = current_user.bios.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bio_params
      params.require(:bio).permit(:Bio)
    end
end
