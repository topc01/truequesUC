class Request < ApplicationRecord
    belongs_to :product
    belongs_to :product, foreign_key: :offer_id
end
