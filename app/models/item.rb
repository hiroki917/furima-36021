class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :day
  belongs_to :user

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :area_id
    validates :category_id
    validates :day_id
    validates :status_id
    validates :shipping_charge_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, numericality: { only_integer: true , message: "Half-width number" }
  validates :name, :explanation, :category_id, :status_id,
            :shipping_charge_id, :area_id, :day_id, :price, :image, presence: true
end
