class CommentsController < ApplicationController
  before_action :set_product, only: [:create]


  def create
    @product.comments.create(comment_params)
    redirect_to @product, notice: 'Comment successfully added.'
  end

  private

  def set_product
    @product = Product.find_by slug:params[:product_id]
  end

  def comment_params
    params.required(:comment).permit(:content)
  end

end