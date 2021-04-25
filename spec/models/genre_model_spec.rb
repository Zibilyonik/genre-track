RSpec.describe Genre, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:games) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
