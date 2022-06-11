class SubTarget < ApplicationRecord
    belongs_to :main_target, optional: true
end