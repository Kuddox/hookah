class HookahsController < ApplicationController
  before_action :set_hookah, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /hookahs
  # GET /hookahs.json
  def index
    @hookahs = Hookah.order(votes: :desc)
  end

  def show
  	@review = @hookah.reviews.build
  end

  # GET /hookahs/new
  def new
    @hookah = Hookah.new
  end

  # GET /hookahs/1/edit
  def edit
  end

  def create
    @hookah = Hookah.new(hookah_params)

    respond_to do |format|
    	if @hookah.save
    		format.html { redirect_to hookahs_path, notice: 'Hookah was successfully created.'}
    		format.json { render :show, status: :created, location: @hookah }
    	else
    		format.html { render :new }
    		format.json { render json: @hookah.errors, status: :unprocessable_entity }
    	end
    end
  end

  def update
  	if @hookah.update_attributes(hookah_params)
  		redirect_to root_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@hookah.destroy
  	redirect_to root_path
  end

  def upvote
  	@hookah = Hookah.find(params[:id])
  	@hookah.votes.create
  	redirect_to(hookahs_path)
  end

  def downvote
  	@hookah = Hookah.find(params[:id])
  	@hookah.votes -= 1
  	@hookah.save
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
