class Task < ActiveRecord::Base
  has_many :users, through: :task_users
  has_many :task_users
end
