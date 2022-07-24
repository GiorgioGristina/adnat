class Shift < ApplicationRecord
  attribute :start_date , :date
  attribute :start_time , :time
  
  belongs_to :user
  belongs_to :organisation
  
  validates :start, :finish, :break, presence: true
  
  def get_date
    self.start.strftime("%d/%m/%y")
  end

  def get_start_time
    self.start.strftime("%H:%M")
  end

  def get_finish_time
    self.finish.strftime("%H:%M")
  end

  def hours_worked
    hours =(self.finish - self.start - (self.break * 60 ) ) /3600
    hours.round(2)  
  end

  def shift_cost
    self.organisation.hourly_rate * self.hours_worked
  end
end
