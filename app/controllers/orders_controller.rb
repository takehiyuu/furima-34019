class OrdersController < ApplicationController
     def index
          @item = Item.find(params[:item_id])
          @order_street_address = OrderStreetAddress.new
     end

     def new
          @order_street_address = OrderStreetAddress.new
     end

     def create
          @item = Item.find(params[:item_id])
          # binding.pry
          @order_street_address = OrderStreetAddress.new(order_params)
          if @order_street_address.valid?
               @order_street_address.save
               redirect_to root_path
          else
               render :index
          end
     end

     private
     # 購入履歴のパラメーター
     def order_params
          params.require(:order_street_address).permit(:city, :postal_code, :addresses, :phone_number, :prefecture_id, :building).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
     end

     # 決済処理の記述
     def pay_item
          Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
          Payjp::Charge.create(
               amount: @item.price,
               card: order_params[:token],
               currency: 'jpy'
          )
     end
end
