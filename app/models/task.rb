class Task < ActiveRecord::Base
  belongs_to :user
  # has_and_belongs_to_many :tasks

  default_scope { order(:position) }
end
