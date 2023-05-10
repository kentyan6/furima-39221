class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :goods_name
    validates :content
    validates :category_id,         numericality: { other_than: 11 , message: "can't be blank" } 
    validates :condition_id,        numericality: { other_than: 7 , message: "can't be blank" }
    validates :delivery_date_id,    numericality: { other_than: 4 , message: "can't be blank" }
    validates :delivery_price_id,   numericality: { other_than: 3 , message: "can't be blank" }
    validates :prefecture_id,       numericality: { other_than: 48 , message: "can't be blank" }
    validates :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end

end