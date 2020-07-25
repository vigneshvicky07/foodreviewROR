class Food < ApplicationRecord
    has_many :reviews
    belongs_to :category
    belongs_to :theme

end
