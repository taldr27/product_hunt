class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path, notice:"Product have been saved."
  end

  private

  def product_params
    params.required(:product).permit(:name, :description, :visible)
  end
end
