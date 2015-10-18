class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :categories
  has_many :statuses

  def tasks_due_today
    self.tasks.where(due_at: Date.today)
  end

  def tasks_due_tomorrow
    self.tasks.where(due_at: Date.today + 1.day)
  end

  def tasks_late
    self.tasks.where('status_id != 3').where('due_at > ?', DateTime.now)
  end

  def tasks_done
    self.tasks.where(status_id: 3)
  end

end
