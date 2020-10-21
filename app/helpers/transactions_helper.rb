module TransactionsHelper
  def transaction_image(arg)
    if !arg.transaction_grouper.empty?
      content_tag(:span) do
        image_tag arg.transaction_grouper.first.picture.variant(resize_to_limit: [500, 500]), class: 'group-image'
      end
    else
      image_tag '/assets/ungrouped.png', class: 'group-image'
    end
  end
end
