class ItemsController < ApplicationController
     def index
          @items = Item.all
     end

     def new
          @item = Item.new
     end

     def create
          item = Item.create(item_params)
     end

     private

     def item_params
          params.require(:item).permit(
               :name, :category_id, :image, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
     end
end