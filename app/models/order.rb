class Order

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :street_number, :building_number, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :area_id,   numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: \A0[5789]0[-]?\d{4}[-]?\d{4}\z, message: "is invalid." }
  end

  def save
    Sips_address.create(post_code: post_code, area_id: area_id, city: city, street_number: street_number, building_number: building_number, phone_number: phone_number)
    Purchase.create(user_id: user.id, item_id: item.id)
  end

end


