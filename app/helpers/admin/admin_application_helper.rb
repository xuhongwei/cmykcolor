module Admin::AdminApplicationHelper
  
  def render_error_message the_model
    if the_model.errors.any?
      content_tag(:div, :id => :error_expl, :class => "panel panel-danger") do
        concat(content_tag(:div, :class => "panel-heading") do
          content_tag(:h3, :class => "panel-title") do
            "#{pluralize(the_model.errors.count, "error")} prohibited this #{the_model.class} from being saved:"
          end
        end)
        concat(content_tag(:div, :class => "panel-body") do
          content_tag(:ul) do
            the_model.errors.full_messages.each do |msg|
              concat content_tag(:li, msg)
            end
          end
        end)
      end
    end
  end

end