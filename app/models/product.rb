class Product < ApplicationRecord
    include ImageUploader::Attachment(:image)
  
    belongs_to :client
    has_many :requests, dependent: :destroy
    has_many :requests, foreign_key: :offer_id, dependent: :destroy
    has_and_belongs_to_many :categories

    validates :title, :description, :use, :state, :client_id, presence: true

    def self.search(keywords)
        if keywords
            where("UPPER(title) LIKE ? OR UPPER(description) LIKE ?", "%#{keywords.upcase}%", "%#{keywords.upcase}%").order('id DESC')
        else
            order('id DESC') 
        end
    end
end
