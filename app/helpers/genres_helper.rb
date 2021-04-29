module GenresHelper
  def lister(genres)
    @line = ActiveSupport::SafeBuffer.new
    genres.each do |x|
      @line << content_tag(:p,
                           content_tag(:strong, link_to(x.name.to_s, genre_path(x.id), class: 'p-1 main-text'),
                                       class: 'main-text h4 row justify-content-center'))
    end
    @line
  end

  def genre_games_list(games)
    @row = ActiveSupport::SafeBuffer.new
    games.each do |x|
      @user = User.find(x.user_id)
      @row << content_tag(:tr) do
        @table = content_tag(:td, x.name, class: 'main-text text-center align-middle')
        @table << content_tag(:td, x.amount, class: 'main-text text-center align-middle')
        @table << content_tag(:td, @user.name, class: %w[main-text text-center align-middle])
      end
    end.join.html_safe
    @row
  end

  def genre_icons_lister(icons)
    @line = ActiveSupport::SafeBuffer.new
    icons.each do |x|
      @line << image_tag("#{x}.png", alt: x.to_s, size: '50x50', class: 'm-1')
      @line << radio_button_tag(:icon, x.to_s)
    end
    @line
  end

  def genre_destroy_button(genre)
    return unless genre.user_id == current_user.id

    content_tag(:p,
                content_tag(:strong,
                            link_to('Destroy', genre_path(genre), method: :delete, data: { confirm: 'Are you sure?' }, class: 'main-text'), class: 'main-text h4 row justify-content-center')) # rubocop:disable Layout/LineLength
  end
end
