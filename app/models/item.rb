class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :user
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  has_one_attached :image

  PRICE_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: '300以上9999999以下で入力して下さい' }
    validates :price, numericality: { with: PRICE_REGEX, message: '販売価格には半角数字のみ使用してください' }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end
  end
end
