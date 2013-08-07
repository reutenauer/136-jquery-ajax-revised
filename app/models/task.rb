class Task < ActiveRecord::Base
  attr_accessible :complete, :name, :user_id
end
