class PagesController < ApplicationController
  Page::PAGE_TYPES.each do |page_type|
    define_method page_type.to_sym do
      @page = Page.find_by_page_type(page_type)
      render :show
    end
  end
end
