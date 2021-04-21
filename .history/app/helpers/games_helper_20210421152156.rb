module GamesHelper
  def game_display(games, external)
    @row = ActiveSupport::SafeBuffer.new
    games.each do |x|
      @row << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: "main-text text-center")
        @table << content_tag(:td, x.created_at, class: "main-text text-center creation-date")
        @table << content_tag(:td, x.amount, class: ["main-text", "text-center"])
        if !external
          @table << content_tag(:td, class: "main-text align-middle") do
            image_tag("#{x.genres.first.icon}.png", size: "50x50", class: "") unless x.genres.empty?
          end
        end
        @table << content_tag(:td, link_to('Show', user_game_path(current_user, x.id), class: "main-text"), class: ["main-text", "text-center"])
      end
    end.join.html_safe
    @row
  end

  def genre_shower(genres)
    @row = ActiveSupport::SafeBuffer.new
    genres.each do |x|
      @row << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: "text-center align-middle main-text")
        @table << content_tag(:td, image_tag("#{genre.icon}.png", size: "60x60"), class: "main-text text-center creation-date")
      end
    end
  end
end
