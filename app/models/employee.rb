class Employee < User

  attr_accessible :first_name, :last_name, :email, :identification, :start_working_on
  
  validates :first_name, :presence=>true
  validates :last_name, :presence=>true
  validates :start_working_on, :presence=>true
  validates :identification, :presence=>true
  validates :email, :presence=>true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  
  scope :all_ordered, order(:first_name)
  

  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  
end
