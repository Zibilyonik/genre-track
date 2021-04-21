module ApplicationHelper
  def header_items
    return unless logged_in?
    @head = content_tag(:li, link_to('Home', user_path(current_user), class: 'main-text'))
    @head << content_tag(:li, link_to('Log Out', '/logout', class: 'main-text'))
  end
end
