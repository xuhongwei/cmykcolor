class Page < ActiveRecord::Base
  default_scope { order(weight: :desc) }
  PAGE_TYPES = %w[about contactus faq]
  validates :page_type,   inclusion: { in: PAGE_TYPES }
  validates :name,        presence: true
  validates :weight,      presence: true
end
