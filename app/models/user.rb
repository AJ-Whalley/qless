class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :jobs
  # has_and_belongs_to_many :applications, table_name: 'applications'

  # unique fix
  has_many :applications 
  has_many :job_applications, through: :applications, source: :job
end
