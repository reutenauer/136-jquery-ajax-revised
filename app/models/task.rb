# encoding: UTF-8

class Task < ActiveRecord::Base
  attr_accessible :complete, :name, :user_id
  belongs_to :user # The assignee (only one)
  has_and_belongs_to_many :users # The follower(s) of that task # TODO Rename as “followers”

  # It makes me happy to be able to say “if tasks.complete?”
  def complete?
    complete
  end

  def assign(assignee)
    self.user = assignee
    save!
  end
end
