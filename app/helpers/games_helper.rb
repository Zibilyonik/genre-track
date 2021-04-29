module GamesHelper
  def game_display(games, external)
    @row = ActiveSupport::SafeBuffer.new
    games.each do |x|
      @row << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: 'main-text text-center align-middle')
        @table << content_tag(:td, x.created_at, class: 'main-text text-center creation-date align-middle')
        @table << content_tag(:td, x.amount, class: 'main-text text-center align-middle')
        unless external
          @table << content_tag(:td, class: 'align-middle text-center main-text') do
            image_tag("#{x.genres.first.icon}.png", size: '50x50', class: '') unless x.genres.empty?
          end
        end
        @table << content_tag(:td, link_to('Show', user_game_path(current_user, x.id), class: 'main-text'),
                              class: 'main-text text-center align-middle')
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
                              class: 'main-text text-center')
      end
    end
    @row
  end

  def game_destroy_button(game)
    return unless game.user_id == current_user.id

    content_tag(:p,
                content_tag(:strong,
                            link_to('Destroy', user_game_path(current_user, game), method: :delete, data: { confirm: 'Are you sure?' }, class: 'main-text'), class: 'main-text h4 row justify-content-center')) # rubocop:disable Layout/LineLength
  end
end
