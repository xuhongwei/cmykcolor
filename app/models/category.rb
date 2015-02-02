class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  has_many :products, class_name: "Product", foreign_key: "category_id"

  default_scope { order(weight: :desc) }
  
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name
    ]
  end
end
