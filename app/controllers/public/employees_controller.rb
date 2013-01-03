class Public::EmployeesController < ApplicationController
  
  # GET /employees/1
  def find_employee
    @employee = Employee.new
  end

  # GET /employees/new
  def search_result_details
    @employee = Employee.find_by_identification(params[:employee][:identification].gsub('\D', ''))
    @vacations = @employee.vacations.where("status != 2").order('requested_on DESC') if @employee
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
    
  end
end
