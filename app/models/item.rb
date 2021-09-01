class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :area
  belongs_to :day
  belongs_to :user

  # validates :area_id, numericality:            { other_than: 1 , message: "can't be blank"}
  # validates :category_id, numericality:        { other_than: 1 , message: "can't be blank"}
  # validates :day_id, numericality:             { other_than: 1 , message: "can't be blank"}
  # validates :status_id, numericality:          { other_than: 1 , message: "can't be blank"}
  # validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}

  with_options numericality:    { other_than: 1 , message: "can't be blank"} do
    validates :area_id
    validates :category_id
    validates :day_id
    validates :status_id
    validates :shipping_charge_id
  end  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, numericality: { only_integer: true }
  validates :name, :explanation, :category_id, :status_id, 
  :shipping_charge_id, :area_id, :day_id, :price, :image, presence: true
  
end
