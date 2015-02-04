class TapshareController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  respond_to :json

  def newpost

    @task = Task.new
    @task.lat = params[:lat]
    @task.lng = params[:lng]
    @task.question = params[:question]
    if @task.save
      render json: @task
    else
      respond_with nil
    end
  end

  def new_food_report
    @food_report = FoodReport.new
    @food_report.lat = params[:lat]
    @food_report.lon = params[:lon]
    if @food_report.save
      render json: @food_report
    else
      respond_with nil
    end
  end

  def verified
    @task = Task.find{|x| x.answers.count > 0}
    render json: @task
  end

  private

    def task_params
      params.require(:task).permit(:lat, :lng, :question)
    end

    def food_params
      params.require(:food_report).permit(:lat, :lon)
    end

end
