module GroupsHelper
  def group_image(arg)
    if arg.picture.attached?
      content_tag(:span) do
        image_tag arg.picture.variant(resize_to_limit: [500, 500]), class: 'group-image'
      end
    else
      image_tag '/assets/default-image.jpg', class: 'group-image'
    end
  end
end
