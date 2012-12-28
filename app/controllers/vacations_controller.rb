class VacationsController < ApplicationController
  before_filter :authenticate_user!
  # GET /vacations
  # GET /vacations.json
  def index
    @employee = Employee.find(params[:employee_id])
    @vacations = @employee.vacations
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacations }
    end
  end

  # GET /vacations/1
  # GET /vacations/1.json
  def show
    @employee = Employee.find(params[:employee_id])
    @vacation = @employee.vacations.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacation }
    end
  end

  # GET /vacations/new
  # GET /vacations/new.json
  def new
    @vacation = Vacation.new
    @employee = Employee.find(params[:employee_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacation }
    end
  end

  # POST /vacations
  # POST /vacations.json
  def create
    @employee = Employee.find(params[:employee_id])
    @vacation = @employee.vacations.build(params[:vacation])
    respond_to do |format|
      if @vacation.save
        format.html { redirect_to [@employee], notice: 'Vacation was successfully created.' }
        format.json { render json: @vacation, status: :created, location: [@employee, @vacation] }
      else
        format.html { render action: "new" }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @employee = Employee.find(params[:employee_id])
    @vacation = @employee.vacations.find(params[:id])
    @vacation.status = 2
    @vacation.deleted_by = current_user.id
    @vacation.save
    respond_to do |format|
      format.html { redirect_to employee_url(@employee) }
      format.json { head :no_content }
    end
  end
  
  private

  # GET /vacations/1/edit
  #def edit
  #  @vacation = Vacation.find(params[:id])
  #end
  
  # PUT /vacations/1
  # PUT /vacations/1.json
  #def update
  #  @vacation = Vacation.find(params[:id])

  #  respond_to do |format|
  #    if @vacation.update_attributes(params[:vacation])
  #      format.html { redirect_to @vacation, notice: 'Vacation was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @vacation.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end
end
