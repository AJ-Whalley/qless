class PagesController < ApplicationController

  def index
  end

  def how_it_works
  end

  def support 
  end


  def support_email
    user_info = {
      user: current_user,
      name: email_params[:name],
      message: email_params[:message]
      }
    ContactMailer.send_contact_email(user_info).deliver_now
    # render :support
    redirect_to pages_user_home_path, notice: "Email has been sent!"
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

  private 
  def email_params
    params.require(:contact).permit(:name, :message)
  end

end
