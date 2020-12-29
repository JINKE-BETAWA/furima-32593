class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      inclusion: {
                        in: (300..9_999_999),
                        message: 'Out of setting range'
                      }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :state_id
    validates :cost_id
    validates :area_id
    validates :day_id
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
