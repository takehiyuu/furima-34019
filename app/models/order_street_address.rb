class OrderStreetAddress
     include ActiveModel::Model
     attr_accessor :postal_code, :city, :addresses, :phone_number, :prefecture_id, :user_id, :item_id, :token, :building,

     with_options presence: true do
          validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "郵便番号を正しく入力してください"}
          validates :city
          validates :addresses
          validates :phone_number, format: {with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "携帯電話の番号を正しく入力してください"}
          validates :prefecture_id, numericality: { other_than: 1 }
          validates :item_id
          validates :user_id
          validates :token
     end

     def save
          order = Order.create(user_id: user_id, item_id: item_id)

          StreetAddress.create(postal_code: postal_code, city: city, addresses: addresses, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id, building: building)
     end
end
 

          