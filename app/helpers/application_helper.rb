module ApplicationHelper
  def show_errors(arg)
    return unless arg.errors.any?

    content_tag(:div, id: 'error_explanation') do
      content_tag(:h2, pluralize(arg.errors.count, 'error')) +
        content_tag(:ul) do
          arg.errors.full_messages.each do |message|
            concat content_tag(:li, message)
          end
        end
    end
  end
end
