class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_employee_module
    @module = EMPLOYEE_MODULE
  end
  
  def set_home_module
    @module = HOME_PAGE
  end
  
  def set_search_employee_module
    @module = SEACH_EMPLOYEE_MODULE
  end
end
