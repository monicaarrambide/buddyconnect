class CreateInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :interests do |t|
      t.integer :interestsId
      t.integer :userId
      t.string :careerInterest
      t.string :hobbies
      t.integer :favMovieGenres
      t.integer :numberPrereqs
      t.string :expectations

      t.timestamps
    end
  end
end
