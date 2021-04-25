FactoryBot.define do
  factory :user do
    sequence(:name, &:to_s)
  end
end

def user_with_games(games_count: 5)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:game, games_count, user: user)
  end
end
