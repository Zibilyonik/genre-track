module GamesHelper
  def game_display(games, external)
    @row = ActiveSupport::SafeBuffer.new
    games.each do |x|
      @row << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: 'main-text text-center')
        @table << content_tag(:td, x.created_at, class: 'main-text text-center creation-date')
        @table << content_tag(:td, x.amount, class: %w[main-text text-center])
        unless external
          @table << content_tag(:td, class: 'align-middle mx-auto') do
            image_tag("#{x.genres.first.icon}.png", size: '50x50', class: 'mx-auto') unless x.genres.empty?
          end
        end
        @table << content_tag(:td, link_to('Show', user_game_path(current_user, x.id), class: 'main-text'),
                              class: %w[main-text text-center])
      end
    end.join.html_safe
    @row
  end

  def game_genre_list(genres)
    @row = ActiveSupport::SafeBuffer.new
    genres.each do |x|
      @row << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: 'text-center align-middle main-text')
        @table << content_tag(:td, image_tag("#{x.icon}.png", size: '60x60'),
                              class: 'main-text text-center creation-date')
      end
    end
    @row
  end
end
