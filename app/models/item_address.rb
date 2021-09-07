class ItemAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :house_number, :buildeing_name, :telephone_number ,
  :user_id, :item_id
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id
    validates :municipalities
    validates :house_number
    validates :telephone_number
    
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, house_number: house_number, buildeing_name: buildeing_name, telephone_number: telephone_number,  purchase_id: purchase.id)
  end
end 