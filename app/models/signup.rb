class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activities

    validates :time, numericality: true, exclusion: {in: [0..23]}
end
