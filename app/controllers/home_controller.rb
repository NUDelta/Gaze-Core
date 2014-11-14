class HomeController < ApplicationController
  
  def index
    @tasks = Task.all
    @hash = Gmaps4rails.build_markers(@tasks) do |task, marker|
      info = task.question + "<br>Number of answers: " + task.answers.count.to_s
      marker.lat task.lat
      marker.lng task.lng
      marker.infowindow info
    end
  end

end