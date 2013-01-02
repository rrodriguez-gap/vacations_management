class Employee < ActiveRecord::Base
  has_many :vacations
  attr_accessible :first_name, :last_name, :email, :identification, :leader_name, :start_working_on
  
  validates :first_name, :presence=>true
  validates :last_name, :presence=>true
  validates :start_working_on, :presence=>true
  validates :identification, :presence=>true
  validates :email, :presence=>true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  
  scope :all_ordered, order(:first_name)
  
  EMPLOYEE_VACATIONS_DAYS_PER_MONTH = 1
  
  def total_vacations_days
	  vacations_per_month + self.vacations.visible.sum(:days)
  end
  
  def vacations_per_month
    return @total_employee_days if defined?(@total_employee_days)
    puts "something here!!"
  	# first calculate the total of months. We will use 30.5 because that's the promedy of days per month in a regular year 
  	total_months =((Date.today - self.start_working_on)/30.45).to_i
  	# compare that we are completely right in our final total months count
  	total_months -= 1 if self.start_working_on + total_months.months > Date.today
  	@total_employee_days = total_months * EMPLOYEE_VACATIONS_DAYS_PER_MONTH
  	@total_employee_days
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  
end
