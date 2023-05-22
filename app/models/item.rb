class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :goods_name
    validates :content
    validates :category_id,         numericality: { other_than: 1 , message: "を選択してください" } 
    validates :condition_id,        numericality: { other_than: 1 , message: "を選択してください" }
    validates :delivery_date_id,    numericality: { other_than: 1 , message: "を選択してください" }
    validates :delivery_price_id,   numericality: { other_than: 1 , message: "を選択してください" }
    validates :prefecture_id,       numericality: { other_than: 1 , message: "を選択してください" }
    validates :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end

end