class Message < ApplicationRecord
    belongs_to :chat
    belongs_to :client
  
    validates :content, presence: true
end