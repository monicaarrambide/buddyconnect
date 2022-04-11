class CreateBiographies < ActiveRecord::Migration[6.1]
  def change
    create_table :biographies do |t|
      t.string :userId
      t.string :description

      t.timestamps
    end
  end
end
