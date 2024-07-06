class CommentResponse < ApplicationRecord
    validates :id_comment, presence: true
    validates :id_response, presence: true
    validates :texto, presence: true
end
