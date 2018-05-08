class PagesController < ApplicationController

  def index
  end

  def how_it_works
  end

  def support
    
  end

  def user_home
    @jobs = Job.all #Make all availabel jobs. 
    @locations = []
    @jobs.each do |job|
     @locations.push({
         lat: job.latitude,
         lng: job.longitude,
         name: job.title
    }) 
    end 
    puts "At location :D "
  end

end
