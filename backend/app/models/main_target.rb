class MainTarget < ApplicationRecord
    has_many :sub_targets 
    belongs_to :user
    validates :target_main, presence: true
end