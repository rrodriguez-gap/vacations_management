class Public::EmployeesController < ApplicationController
  
  # GET /employees/1
  def find_employee
    @employee = Employee.new
  end

  # GET /employees/new
  def search_result_details
    @employee = Employee.find_by_identification(params[:employee][:identification])
    @vacations = @employee.vacations.where("status != 2").order('requested_on DESC')
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end
end
