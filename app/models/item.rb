class Item < ApplicationRecord

  with_options presence: true do

  end



  has_one          :purchase
  belongs_to       :user
  has_one_attached :image
end
