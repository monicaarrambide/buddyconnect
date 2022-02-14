class Interest < ApplicationRecord
    validates :interestsId, presence: true
    validates :userId, presence: true
    validates :careerInterest, presence: true
    validates :hobbies, presence: true
    validates :favMovieGenres, presence: true
    validates :numberPrereqs, presence: true
    validates :expectations, presence: true

end


