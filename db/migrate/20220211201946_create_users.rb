class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :studentId
      t.integer :groupId
      t.integer :insterestsId
      t.integer :profileId
      t.boolean :isOfficer
      t.boolean :isAdmin
      t.string :firstName
      t.string :lastName
      t.string :tamuEmail
      t.date :dateOfBirth
      t.boolean :gradAssistance

      t.timestamps
    end
  end
end
