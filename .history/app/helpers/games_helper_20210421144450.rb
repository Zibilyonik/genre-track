module GamesHelper
  def game_display(games)
    games.each do |x|
      content_tag(:tr) do
        @test = content_tag(:td, x.name, class: "main-text text-center")
        @test << content_tag(:td, x.created_at, class: "main-text text-center creation-date")
        @test << content_tag(:td, x.amount, class: ["main-text", "text-center"])
        unless x.genres.empty?
          @test << content_tag(:td, image_tag("#{x.genres.first.icon}.png", size: "50x50", class: "align-center ml-5"), class: "main-text align-middle")
        end
        @test << content_tag(:td, link_to('Show', user_game_path(current_user, x.id), class: "main-text"), class: ["main-text", "text-center"])
      end
    end
    @test
  end
end
