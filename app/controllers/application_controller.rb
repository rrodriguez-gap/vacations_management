class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_employee_module
    @module = EMPLOYEE_MODULE
  end
  
  def set_new_employee_page
    @module = NEW_EMPLOYEE_PAGE
  end
  
  def set_search_employee_module
    @module = SEARCH_EMPLOYEE_MODULE
  end
  
  def set_account_module
    @module = MY_ACCOUNT_PAGE
  end
  
  def set_users_module
    @module = USERS_PAGE
  end
end
