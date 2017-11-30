module ApplicationHelper
  def image_default(instance, default_image)
    if instance.photo
      cl_image_path instance.photo, crop: :fill
    else
      image_path default_image
    end
  end
end
