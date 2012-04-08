class Teacher < ActiveRecord::Base
  
  include Utility
  
  validates :first_name,  :last_name,  :presence => true
  validates :mobile, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true

  has_many :schedules, :dependent => :destroy
  has_many :students, :through => :schedules
  has_many :subjects, :through => :schedules
  has_many :classes, :through => :schedules, :class_name => Classroom, :foreign_key => :classroom_id
  
  has_many :attendances, :as => :targetable, :dependent => :destroy
  
  class << self
  end
  
  def name
    [first_name, last_name].join(' ')
  end
  
end
