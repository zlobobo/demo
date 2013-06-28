class Timetable < ActiveRecord::Base
  attr_accessible :task_id, :comment,:hours,:user,:user_id,:date
  
  belongs_to :user

  validates :task_id, inclusion: { in: 1..10000 }
  validates :comment, length: { maximum: 50 }
  validates :hours, numericality: true
  validates :task_id, numericality: true
  validates :date, presence: true
  validates :user_id, presence: true

end
