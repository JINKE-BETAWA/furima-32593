class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      inclusion: {
                        in: (300..9999999),
                        message: 'Out of setting range'
                      }
  end

  validates :category_id, numericality: { other_than: 1, message:'Select'}
  validates :state_id, numericality: { other_than: 1, message:'Select' }
  validates :cost_id, numericality: { other_than: 1, message:'Select' }
  validates :area_id, numericality: { other_than: 1, message:'Select' }
  validates :day_id, numericality: { other_than: 1, message:'Select' }

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
