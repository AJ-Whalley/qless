require 'rails_helper'


RSpec.describe User, type: :model do
  it '#job_applications' do 
    # user1 = User.create!(password: 'greeneggs', email: 'u1@example.com')
    # user2 = User.create!(password: 'greeneggs', email: 'u2@example.com')
    user1 = User.find(1)
    user2 = User.find(2)
    # job = Job.create!(user: user1, city: 'Melbourne', street_address: '120 Spencer Street')
    job = user1.jobs.first
    # job.applicants << user2 
    expect(user2.job_applications.first.id).to eq(job.id)
  end
end
