class AssignTaskToUser < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.references :user, default: nil
    end
  end
end
