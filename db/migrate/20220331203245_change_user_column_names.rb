class ChangeUserColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :firstName, :fullName
    rename_column :users, :lastName, :avatarUrl
  end
end
