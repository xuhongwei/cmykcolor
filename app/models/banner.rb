class Banner < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  # scope
  default_scope { order(weight: :desc, updated_at: :desc) }

  validates_presence_of :name
  validates_presence_of :weight
  validates_presence_of :url
  validates :weight,    :numericality => {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 99999
  }
end
