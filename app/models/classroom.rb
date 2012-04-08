class Classroom < ActiveRecord::Base
  
  has_many :schedules, :dependent => :destroy
  has_many :teachers, :through => :schedules
  has_many :students, :through => :schedules
  has_many :subjects, :through => :schedules
  
end
