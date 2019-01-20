class Admin::SurveysController < Admin::BaseController
  before_action :target_survey, :only => [:update, :update_number_of_player, :edit_endgrades, :go_endings]
  def index
    @survey = Survey.first
  end

  def update
    if @survey.update_attributes(survey_params)
      flash[:notice] = "survey updated successfully"
      redirect_to go_endings_admin_survey_path
    else
      flash[:alert] = "Fail to update a survey"
      @survey = Survey.first
      render :action => :index
    end
  end

  def update_number_of_player
    if @survey.update_attributes(survey_params)
      flash[:notice] = "update the number of players"
      redirect_to edit_endgrades_admin_survey_path
    else
      flash[:alert] = "Fail to update a survey"
      @survey = Survey.first
      render :action => :index
    end
  end

  def edit_endgrades
    # redirect_to root_path
    # @survey = Survey.first
    # redirect_to go_endings_admin_survey_path
  end

  def go_endings
    @endgrades = Endgrade.all
  end

  private
  def survey_params
    params.require(:survey).permit(:number_of_players,
                                   endgrades_attributes: [:id, 
                                                          :asset, 
                                                          :is_drunk, 
                                                          :is_kindhearted_landlord, 
                                                          :mission_1, 
                                                          :mission_2,
                                                          :m1_is_done,
                                                          :m2_is_done,
                                                          :is_mission_3])
  end

  def target_survey
    @survey = Survey.find(params[:id])
  end
end
