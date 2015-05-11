class Page < ActiveRecord::Base
  default_scope { order(weight: :desc, id: :desc) }
  PAGE_TYPES = %w[about contactus faq term testimonial]
  # scope
  default_scope { order(weight: :desc, updated_at: :desc) }

  validates :page_type,   inclusion: { in: PAGE_TYPES }
  validates :name,        presence: true
  validates :weight,      presence: true
  validates :weight,      :numericality => {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 99999
  }
end
