class HomeController < ApplicationController
  
  def index
    @tasks = Task.all
    @hash = Gmaps4rails.build_markers(@tasks) do |task, marker|
      marker.lat task.lat
      marker.lng task.lng
    end
  end

end