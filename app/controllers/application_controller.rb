class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_ip_address
  
  protected
  
  def user_is_spider?(user_agent)
    is_bot = false
    if user_agent && !user_agent.empty?
      spiders = ['agent', 'bot', 'spider', 'google', 'yahoo', 'search', 'crawl', 'slurp', 'msn', 'teoma', 'gulper', 'winona']
      spiders.each do |spider|
        if user_agent.downcase.include?(spider)
          is_bot = true
          break
        end
      end
    end
    return is_bot
  end
  
  def octets(ip_address)
    ip_address.split('.')
  end
  
  def check_ip_address
    
    unless (request.env['HTTP_FROM'] && !request.env['HTTP_FROM'].empty?) && user_is_spider?(request.env['HTTP_USER_AGENT'])
      octet = octets(request.env['REMOTE_ADDR']).last.to_i
      # Now we can define appropriate logic according to range of octet[1], octet[2], octet[2], octet[3]
      # Example
      if octet > 99
        redirect_to students_path && return
      elsif octet < 99 && octet > 55
        redirect_to teachers_path && return
      else
        redirect_to root_path && return
      end
    end
    
  end
  
end
