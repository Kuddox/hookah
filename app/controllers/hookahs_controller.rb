class HookahsController < ApplicationController
  before_action :set_hookah, only: [:show, :edit, :update, :destroy]

  # GET /hookahs
  # GET /hookahs.json
  def index
    @hookahs = Hookah.all
  end

  # GET /hookahs/1
  # GET /hookahs/1.json
  def show
  end

  # GET /hookahs/new
  def new
    @hookah = Hookah.new
  end

  # GET /hookahs/1/edit
  def edit
  end

  # POST /hookahs
  # POST /hookahs.json
  def create
    @hookah = Hookah.new(hookah_params)

    respond_to do |format|
      if @hookah.save
        format.html { redirect_to hookahs_path, notice: 'Hookah was successfully created.' }
        format.json { render :show, status: :created, location: @hookah }
      else
        format.html { render :new }
        format.json { render json: @hookah.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hookahs/1
  # PATCH/PUT /hookahs/1.json
  def update
    respond_to do |format|
      if @hookah.update(hookah_params)
        format.html { redirect_to hookahs_path, notice: 'Hookah was successfully updated.' }
        format.json { render :show, status: :ok, location: @hookah }
      else
        format.html { render :edit }
        format.json { render json: @hookah.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hookahs/1
  # DELETE /hookahs/1.json
  def destroy
    @hookah.destroy
    respond_to do |format|
      format.html { redirect_to hookahs_url, notice: 'Hookah was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
  	@hookah = Hookah.find(params[:id])
  	@hookah.votes.create
  	redirect_to(hookahs_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hookah
      @hookah = Hookah.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hookah_params
      params.require(:hookah).permit(:title, :description)
    end
end
