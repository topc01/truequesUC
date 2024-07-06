class Comment < ApplicationRecord
    has_one :client
    belongs_to :product
    has_many :comment_responses, foreign_key: 'id_comment', class_name: 'CommentResponse', dependent: :destroy

    validates :client_id, :product_id, :content, presence: true
end
