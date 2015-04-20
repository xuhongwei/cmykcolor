class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  has_many :products, class_name: "Product", foreign_key: "category_id"

  # validate
  validates :name, :presence => true
  validates :weight, :numericality => {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 99999
  }

  # scope
  default_scope { order(weight: :desc, updated_at: :desc) }
  
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name
    ]
  end
end
