class Item < ApplicationRecord

  with_options presence: true do





  end



  has_one          :purchase
  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :cost
  belongs_to :area
  belongs_to :day

end
