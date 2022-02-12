class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :profileId
      t.integer :userId
      t.string :year
      t.string :picture
      t.string :contactInfo

      t.timestamps
    end
  end
end
