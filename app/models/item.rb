class Item < ApplicationRecord
     has_one :order
     belongs_to :user
     has_one_attached :image

     PRICE_REGEX = /\A[0-9]+\z/.freeze
     validates_format_of :price, with: PRICE_REGEX, message: '販売価格には半角数字のみ使用してください'

     with_options presence: true do

          validates :name
          validates :info
          validates :category_id
          validates :image
          validates :sales_status_id
          validates :shipping_fee_status_id
          validates :prefecture_id
          validates :scheduled_delivery_id
          validates :price, length: {minimum: 3, maximum:8}

     end
end