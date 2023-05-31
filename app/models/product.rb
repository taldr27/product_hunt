# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Product < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: {message: 'Product Name is required'}
  validates :description, presence: {message: 'Product Description is required'}

  validates :name, length: {maximum: 200, minimum: 2}

  has_one_attached :image, :dependent => :destroy

  has_many :product_categories
  has_many :categories, through: :product_categories # join

  accepts_nested_attributes_for :categories

  def category_default
    return self.categories.first.name if self.categories.any?
    'No category'
  end

end
