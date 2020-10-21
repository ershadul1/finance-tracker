module UsersHelper
  def user_image(arg)
    if !arg.avatar.attached?
      image_tag arg.avatar.variant(resize_to_limit: [1000, 1000])
    else
      image_tag '/assets/default-user.jpg'
    end
  end
end
