class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :category
  default_scope { order("position ASC") }

  validates :name, presence: true

end
