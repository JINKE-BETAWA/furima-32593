class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A[a-z0-9]+\z/i, message: ''},
      :numericality => {
      :greater_than_or_equal_to => 300,
      :less_than_or_equal_to => 9999999,
      :message => ''
      }
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :cost_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }


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
