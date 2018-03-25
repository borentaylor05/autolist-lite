class Listing < ApplicationRecord
    validates :vin, uniqueness: true
end
