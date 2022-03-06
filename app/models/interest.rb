class Interest < ApplicationRecord
    validates :userId, presence: true
    validates :phone, presence: true
    validates :nationality, presence: true
    validates :state, presence: true
    validates :community, presence: true
    validates :numPrereqs, presence: true
    validates :scholarship, presence: true
    validates :faveMovieGenre, presence: true
    validates :potentialRoles, presence: true
    validates :numWorkExp, presence: true
    validates :usedTech, presence: true
    validates :projects, presence: true
    validates :extracurric, presence: true
    validates :pastWorkExp, presence: true
end
