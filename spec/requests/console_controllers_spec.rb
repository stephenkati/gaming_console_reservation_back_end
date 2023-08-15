RSpec.describe Console, type: :model do
  describe 'validations' do
    let(:console) { create(:console) }

    it 'should be valid with correct params' do
      expect(console).to be_valid
    end
  end
end
