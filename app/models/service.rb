class Service < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  mount_uploader :photo, PhotoUploader

  default_scope { order(weight: :desc, updated_at: :desc) }

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name
    ]
  end
end
