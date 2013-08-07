class Task < ActiveRecord::Base
  attr_accessible :complete, :name, :user_id
  belongs_to :user

  def assign(assignee)
    self.user = assignee
    save!
  end
end
