class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :postId
      t.integer :posterId
      t.date :postDate
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
