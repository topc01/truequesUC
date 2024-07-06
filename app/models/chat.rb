class Chat < ApplicationRecord
    belongs_to :client, foreign_key: :client1_id
    belongs_to :client, foreign_key: :client2_id
    has_many :messages, dependent: :destroy

    validates :client1_id, :client2_id, presence: true
end
