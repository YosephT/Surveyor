class SurveyResponsesController < ApplicationController
  before_action :set_survey_response, only: [:show, :edit, :update, :destroy]

  # GET /survey_responses
  def index
    @survey_responses = SurveyResponse.all
  end

  # GET /survey_responses/1
  def show
  end

  # GET /survey_responses/new
  def new
    @survey_response = SurveyResponse.new
  end

  # GET /survey_responses/1/edit
  def edit
  end

  # POST /survey_responses
  def create
    @survey_response = SurveyResponse.new(survey_response_params)

    if @survey_response.save
      redirect_to @survey_response, notice: 'Survey response was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /survey_responses/1
  def update
    if @survey_response.update(survey_response_params)
      redirect_to @survey_response, notice: 'Survey response was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /survey_responses/1
  def destroy
    @survey_response.destroy
    @current_question = Question.find(@survey_response.question_id)
    redirect_to question_path(@current_question), notice: 'Survey response was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response
      @survey_response = SurveyResponse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survey_response_params
      params[:survey_response]
    end
end
