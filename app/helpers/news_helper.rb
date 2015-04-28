module NewsHelper
  def link_to_previous_news previous_news
    if previous_news.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_previous",
              :class => "unclickble"
    else
      link_to "", news_path(previous_news), :id => "product_relative_previous"
    end
  end

  def link_to_next_news next_news
    if next_news.blank?
      link_to "", "javascript:void(0);",
              :id => "product_relative_next",
              :class => "unclickble"
    else
      link_to "", news_path(next_news), :id => "product_relative_next"
    end
  end
end
