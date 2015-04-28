module ProductsHelper
  def category_active? category
    "products_index_one_category " << (category.try(:id) == @category.try(:id) ? "active" : "")
  end

  def category_all?
    (@category.blank? ? "active" : "")
  end

  def current_category
    @category.try(:name) || "All"
  end

  def link_to_previous_product previous_product
    if previous_product.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_previous",
              :class => "unclickble"
    else
      link_to "", product_path(previous_product), :id => "product_relative_previous"
    end
  end

  def link_to_next_product next_product
    if next_product.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_next",
              :class => "unclickble"
    else
      link_to "", product_path(next_product), :id => "product_relative_next"
    end
  end

  def link_to_previous_category_product category, previous_product
    if previous_product.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_previous",
              :class => "unclickble"
    else
      link_to "", category_product_path(category, previous_product),
              :id => "product_relative_previous"
    end
  end

  def link_to_next_category_product category, next_product
    if next_product.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_next",
              :class => "unclickble"
    else
      link_to "", category_product_path(category, next_product),
             :id => "product_relative_next"
    end
  end

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
