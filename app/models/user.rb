class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :surveys, through: :project
  has_many :projects

  enum role: [:researcher, :subject]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :researcher
  end
end
