module ApplicationHelper
  def app_description
    'App description here.'
  end

  def app_logo
    image_tag current_setting.logo.url(:tiny)
  end

  def app_title
    current_setting.title
  end
end
