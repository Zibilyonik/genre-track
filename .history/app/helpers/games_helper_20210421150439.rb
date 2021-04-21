module GamesHelper
  def game_display(games)
    p games.all
    @test = ActiveSupport::SafeBuffer.new
    games.each do |x|
      @test << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: "main-text text-center")
        @table << content_tag(:td, x.created_at, class: "main-text text-center creation-date")
        @table << content_tag(:td, x.amount, class: ["main-text", "text-center"])
        unless x.genres.empty?
          @table << content_tag(:td, image_tag("#{x.genres.first.icon}.png", size: "50x50", class: ""), class: "main-text align-middle")
        end
        @table << content_tag(:td, link_to('Show', user_game_path(current_user, x.id), class: "main-text"), class: ["main-text", "text-center"])
      end
    end.join.html_safe
    @test
  end
end
