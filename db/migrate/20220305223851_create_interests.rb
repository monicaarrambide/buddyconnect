class CreateInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :interests do |t|
      t.integer :userId
      t.string :phone
      t.string :nationality
      t.string :state
      t.string :community
      t.integer :numPrereqs
      t.string :scholarship
      t.string :faveMovieGenre
      t.string :potentialRoles
      t.integer :numWorkExp
      t.string :usedTech
      t.string :projects
      t.string :extracurric
      t.string :pastWorkExp

      t.timestamps
    end
  end
end
