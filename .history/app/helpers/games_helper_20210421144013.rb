module GamesHelper
  def game_display(games)
    games.collect do |x|
      hcontent_tag :tr do
        h.content_tag(:td, x.name, class: ["main-text", "text-center"])
        h.content_tag(:td, x.created_at, class: ["main-text", "text-center", "creation-date"])
        h.content_tag(:td, x.amount, class: ["main-text", "text-center"])
        unless x.genres.empty?
          h.content_tag(:td, image_tag("#{x.genres.first.icon}.png", size: "50x50"), class: ["main-text", "align-middle"])
        end
        h.content_tag(:td, link_to('Show', user_game_path(current_user, x.id), class: "main-text"), class: ["main-text", "text-center"])
      end
    end
  end
end
