class Heroine < ApplicationRecord
    has_one :power
    validates :name, uniqueness: true
end
