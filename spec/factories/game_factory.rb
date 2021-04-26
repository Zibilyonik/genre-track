FactoryBot.define do
  factory :game do
    name { 'Gamey' }
    amount { 25.6 }
    user
  end
end

def game_with_genres(genres_count: 2)
  FactoryBot.create(:game) do |game|
    FactoryBot.create_list(:genre, genres_count, game: game)
  end
end
