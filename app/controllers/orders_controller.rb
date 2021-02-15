class OrdersController < ApplicationController
     before_action :authenticate_user!
     before_action :set_item, only: [:index, :create]
     def index
          if @item.user_id == current_user.id || @item.order.present?
               redirect_to root_path
          end
          @order_street_address = OrderStreetAddress.new
     end

     def create
          @order_street_address = OrderStreetAddress.new(order_params)
          if @order_street_address.valid?
               pay_item
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

     def set_item
          @item = Item.find(params[:item_id])
     end
end
