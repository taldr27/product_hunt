class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product has been updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.persisted?
      redirect_to product_path(@product), notice:"Product have been saved."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other, notice: "Product have been deleted."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.required(:product).permit(:name, :description, :visible)
  end
end
