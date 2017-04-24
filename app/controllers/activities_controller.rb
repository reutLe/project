class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    search_query = params[:search]
    @activities = search_query.present? ? Activity.where("name LIKE ? OR
     act_description LIKE ? OR
      act_kind LIKE ? AND ages LIKE ?",
       "%#{search_query}%", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%") :  Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  def search
    search_query = params[:search]
    results = []
    Activity.where("name LIKE ? OR act_description LIKE ? OR act_kind LIKE ? AND ages LIKE ?", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%")
    @activities = Activity.all
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.user_id = session[:login]
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :goals, :act_kind, :act_description, :openning_game, :methods, :image, :accessories,  :ages => [])
    end
end
