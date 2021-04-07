class Goal < ApplicationRecord

    belongs_to :owner,
        primary_key: :id,
        foreign_key: :owner_id,
        class_name: :User

    has_many :views,
        primary_key: :id,
        foreign_key: :goal_id,
        class_name: :View

end
