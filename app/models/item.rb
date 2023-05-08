class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :delivery_price
  belongs_to :prefecture

  validates :goods_name, :content, :price, presence: true

  validates :category_id, :condition_id, :delivery_date_id, :delivery_price_id, :prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 

end
