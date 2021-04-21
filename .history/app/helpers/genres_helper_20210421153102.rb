module GenresHelper
  def lister(genres)
    @line = ActiveSupport::SafeBuffer.new
    genres.each do |x|
      @line << content_tag(:p, content_tag(:strong, link_to("#{x.name}", user_genre_path(current_user, x.id), class: "p-1 main-text"), class: "main-text h4 row justify-content-center"))
    end
    @line
  end
end
