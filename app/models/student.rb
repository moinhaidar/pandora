class Student < ActiveRecord::Base
  
  include Utility
  
  validates :first_name,  :last_name,  :presence => true
  validates :mobile, :presence => true, :uniqueness => true, :format => { :with => Utility::Mobile} 
  validates :email, :presence => true, :uniqueness => true
  
  has_many :schedules, :dependent => :destroy
  has_many :teachers, :through => :schedules
  has_many :subjects, :through => :schedules
  
  has_many :attendances, :as => :targetable, :dependent => :destroy
  
  default_scope :order => 'active DESC'
  
  scope :active, where(:active => true)
  scope :deactive, where(:active => false)
  
  #Class Methods
  class << self
  end
  
  #Instance Methods
  def name
    [first_name, last_name].join(' ')
  end
  
  def active?
    active ? 'Yes' : 'No'
  end
  
end
