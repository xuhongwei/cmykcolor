module ServicesHelper
  def link_to_previous_service previous_service
    if previous_service.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_previous",
              :class => "unclickble"
    else
      link_to "", service_path(previous_service), :id => "product_relative_previous"
    end
  end

  def link_to_next_service next_service
    if next_service.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_next",
              :class => "unclickble"
    else
      link_to "", service_path(next_service), :id => "product_relative_next"
    end
  end
end
