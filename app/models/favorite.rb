class Favorite < ApplicationRecord
  belongs_to :post, counter_cache: :favorites_count
  belongs_to :user
end
