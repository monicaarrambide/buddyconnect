class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :commentId
      t.integer :postId
      t.integer :posterId
      t.date :commentDate
      t.string :message

      t.timestamps
    end
  end
end
