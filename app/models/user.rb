class User < ApplicationRecord
    has_many :scores, dependent: :destroy

    validates :name, uniqueness: :true
    validates :name, presence: :true
end
