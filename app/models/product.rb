class Product < ApplicationRecord
  validates :name, presence: {message: 'Product Name is required'}
  validates :description, presence: {message: 'Product Description is required'}

  validates :name, length: {maximum: 200, minimum: 2}
end
