class RemoveHieghtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :hieght, :integer
  end
end
