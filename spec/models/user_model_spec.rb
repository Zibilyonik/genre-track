RSpec.describe User, type: :model do
  describe 'validations' do
    before { create(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { should have_many(:genres) }
    it { should have_many(:games) }
  end
end
