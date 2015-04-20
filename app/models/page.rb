class Page < ActiveRecord::Base
  default_scope { order(weight: :desc, id: :desc) }
  PAGE_TYPES = %w[about contactus faq term testimonial]
  validates :page_type,   inclusion: { in: PAGE_TYPES }
  validates :name,        presence: true
  validates :weight,      presence: true
end
