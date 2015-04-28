class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  belongs_to :category, class_name: "Category", foreign_key: "category_id"
  mount_uploader :photo, PhotoUploader
  paginates_per 1

  default_scope { order(weight: :desc, updated_at: :desc) }
  scope :previous, ->(i, limit) { where("id < ?", i.id).order(id: :desc).limit(limit) }
  scope :next, ->(i, limit) { where("id > ?", i.id).order(id: :asc).limit(limit) }

  validates :name,    presence: true, uniqueness: true
  validates :weight,  presence: true
  validates :brief,   presence: true
  validates :detail,  presence: true

  def self.search_by_name_and_detail q, limit = 10
    q_downcase = q.try(:downcase)
    self.where("lower(name) like ? or lower(brief) like ? or lower(detail) like ?",
               "%#{q_downcase}%",
               "%#{q_downcase}%",
               "%#{q_downcase}%").limit(limit) if q.present?
  end

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :name
    ]
  end
end
