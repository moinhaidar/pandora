class HolidaysController < ApplicationController

  active_scaffold :holiday do |config|
    config.label = "Holidays"
    config.columns = [:name, :date, :description, :weekend]
    list.sorting = {:name => 'ASC'}
    create.columns = [:name, :date, :description, :weekend]
    update.columns = [:name, :date, :description, :weekend]
  end
  
end 