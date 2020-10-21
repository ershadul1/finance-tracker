module GroupsHelper
  def group_image(arg)
    if arg.picture.attached?
      image_tag arg.picture.variant(resize_to_limit: [500, 500]), class: 'group-image'
    else
      image_tag("/assets/default-group.png", :alt => "group-image", class: 'group-image')
    end
  end
end
