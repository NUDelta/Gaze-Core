class TapshareController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  respond_to :json

  def newpost
    @task = Task.new(task_params)
    if @task.save
      respond_with @task
    else
      respond_with nil
    end
  end

  private

    def task_params
      params.require(:task).permit(:lat, :lng, :question)
    end

end