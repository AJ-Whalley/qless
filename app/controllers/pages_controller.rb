class PagesController < ApplicationController

  def index
  end

  def how_it_works
  end

  def support
    
  end

  def user_home
    @jobs = Job.all
    
  end

end
