class View < ApplicationRecord

    belongs_to :goal,
        primary_key: :id,
        foreign_key: :goal_id,
        class_name: :Goal
end
