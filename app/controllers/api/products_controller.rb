class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render "api/products/show"
    else
      render json: @product.errors.full_messages, status: 422
    end
end

private
  def product_params
    params.require(:product).permit(:product_name, :product_image, :description)
  end

end
