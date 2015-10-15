class User < ActiveRecord::Base
  has_many :tasks, depedent: :destroy
end
