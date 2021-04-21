module ApplicationHelper
  def header_items(bool)
    if bool
      content_tag(:li, link_to("Home", user_path(current_user), class: "main-text")) 
    end
  end
end
