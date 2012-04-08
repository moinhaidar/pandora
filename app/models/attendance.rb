class Attendance < ActiveRecord::Base
  
  validates :att_date, :presence => true, :uniqueness => true
  
  belongs_to :targetable, :polymorphic => true
  
end
