class Item < ApplicationRecord
     has_one :order
     belongs_to :user
     belongs_to :category
     belongs_to :prefecture
     belongs_to :sales_status
     belongs_to :scheduled_delivery
     belongs_to :shipping_fee_status
     has_one_attached :image


     PRICE_REGEX = /\A[0-9]+\z/.freeze
     validates_format_of :price, with: PRICE_REGEX, message: '販売価格には半角数字のみ使用してください'

     with_options presence: true do

          validates :name
          validates :info
          validates :image
          validates :category_id,            numericality: { other_than: 1 }
          validates :sales_status_id,        numericality: { other_than: 1 }
          validates :shipping_fee_status_id, numericality: { other_than: 1 }
          validates :prefecture_id,          numericality: { other_than: 1 }
          validates :scheduled_delivery_id,  numericality: { other_than: 1 }
          validates :price,                  length:       {minimum: 3, maximum:8}

     end
end