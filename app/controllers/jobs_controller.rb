class JobsController < ApplicationController
  before_action :set_job, only: [:charge, :apply, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:charge]
  # GET /jobs
  # GET /jobs.json
  def index  
    @jobs = Job.all  
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  def charge
    
    amount = @job.price.to_i
    
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: @job.title,
      currency: 'AUD'
    )
    flash[:notice] = "Payment made!"

    redirect_to pages_user_home_path
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_back fallback_location: pages_user_home_path

  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs/1/apply
  def apply
    @application_count = Application.count
    @job.applicants << current_user
    if Application.count != @application_count
      flash[:notice] = "Job application successful!"
      redirect_to jobs_qer_path
    else
      redirect_to jobs_qer_path
      flash[:notice] = "Job application failed"
    end
  end

  # POST /jobs/1/application_update
  def application_update
    current_application_number = params[:application_number]
    current_application_job_id = params[:application_job_id]
    Application.find(current_application_number).update(approved: true)
    Job.find(current_application_job_id).applications.where(approved: nil).each do |app|
      app.update(approved: false)
    end 
    redirect_to jobs_path(current_user)
    flash[:notice] = "Your job has been approved"
  end 

  def qer 
    @jobs = Job.all
  end 

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
   
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:user_id, :street_address, :city, :latitude, :longitude, :title, :started_at, :completed_at, :price, :instructions, :uuid, :qrcode_data, :stripe_charge_id)
    end
end
