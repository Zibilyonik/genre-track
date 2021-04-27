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
end
