class Api::InventoriesController < ApplicationController

  def show
    @inventory = Inventory.find(params[:product_id])
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save
      render "api/inventories/show"
    else
      render json: @inventory.errors.full_messages, status: 422
    end
  end

private

  def inventory_params
    params.require(:inventory).permit(:product_id, :waist, :length, :style, :count)
  end

end
