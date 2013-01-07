class Vacation < ActiveRecord::Base
  belongs_to :employee
  belongs_to :user, :foreign_key=>'deleted_by'
  STATUSES = ['','APPROVED','DELETED']
  
  default_scope order('since DESC')
  
  scope :visible, where(:status=>1)
  scope :total_days, sum(:days)
  
  validates :description, :presence=> true
  validates :days, :presence=> true, :numericality=>true
  validates :requested_on, :presence=>true
  
  attr_accessible :type, :description, :days, :requested_on, :until, :since
  
  attr_accessor :type
  
  before_save :change_days_from_type
 
  def status_name
    STATUSES[self.status]
  end
  
  before_create :set_resquested_on
  
  protected
  def change_days_from_type
    self.days = self.days * -1 if self.type.to_i == 1
  end
  
  def set_resquested_on
    self.requested_on = Time.now
  end
  
end
