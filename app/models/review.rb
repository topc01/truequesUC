class Review < ApplicationRecord
    belongs_to :client
    belongs_to :client, foreign_key: :sender_id

    validates :client_id, :sender_id, :title, :grade, :content, presence: true

end

