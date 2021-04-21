module ApplicationHelper
  def header_items
    if logged_in?
      content_tag(:li, link_to("Home", user_path(current_user), class: "main-text"))
      content_tag(:li, link_to("Log Out", '/logout', class: "main-text"))       
    end
  end
end
