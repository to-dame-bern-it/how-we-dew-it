class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :category
  # has_and_belongs_to_many :tasks
  default_scope { order("position ASC") }

end
