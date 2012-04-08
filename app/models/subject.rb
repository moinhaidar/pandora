class Subject < ActiveRecord::Base
  
  validates :title, :presence => true, :uniqueness => true
  
  has_many :schedules, :dependent => :destroy
  has_many :students, :through => :schedules
  has_many :teachers, :through => :schedules
  has_many :classrooms, :through => :schedules
  
end
