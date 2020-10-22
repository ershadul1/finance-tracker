module GroupsHelper
  def group_image(arg)
    if arg.picture.attached?
      image_tag arg.picture, class: 'group-image'
    else
      image_tag('/assets/default-group.png', alt: 'group-image', class: 'group-image')
    end
  end
end
