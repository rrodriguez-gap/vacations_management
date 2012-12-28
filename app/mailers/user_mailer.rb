class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def vacations_days_report(employee)
    @employee = employee
    mail(:to => employee.email, :subject => "Total Vacations Days")
  end


end
