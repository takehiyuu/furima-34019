class OrdersController < ApplicationController
     before_action :authenticate_user!
     before_action :set_item
     def index
          set_item
          set_order_street_address
          if @item.user_id == current_user.id
               redirect_to root_path
          end
          if @item.order.present?
               redirect_to root_path
          end
     end

     def new
          set_order_street_address
     end

     def create
          set_item
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

     def set_item
          @item = Item.find(params[:item_id])
     end

     def set_order_street_address
          @order_street_address = OrderStreetAddress.new
     end
end
