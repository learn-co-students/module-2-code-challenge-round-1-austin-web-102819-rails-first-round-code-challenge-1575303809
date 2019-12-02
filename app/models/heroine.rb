class Heroine < ApplicationRecord
    has_one :power

    include ActiveModel::Validations
    validates :name, presence: true, uniqueness: {scope: [:name, :super_name]}
end
