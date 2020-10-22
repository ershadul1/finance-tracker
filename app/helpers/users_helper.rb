module UsersHelper
  def user_image(arg)
    if arg.avatar.attached?
      image_tag arg.avatar
    else
      image_tag '/assets/default-user.jpg'
    end
  end
end
