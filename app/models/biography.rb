class Biography < ApplicationRecord
    validates :userId, presence: true
    validates :description, presence: true
end
