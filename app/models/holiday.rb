class Holiday < ActiveRecord::Base
  attr_accessible :date, :name, :type, :weekend
end
