module TransactionsHelper
  def transaction_image(arg)
    if !arg.transaction_grouper.empty?
      content_tag(:span) do
        image_tag arg.transaction_grouper.first.picture, class: 'group-image'
      end
    else
      image_tag '/assets/ungrouped.png', class: 'group-image'
    end
  end
end
