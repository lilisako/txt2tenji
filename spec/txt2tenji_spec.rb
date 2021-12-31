# frozen_string_literal: true

RSpec.describe Txt2tenji do
  describe 'VERSION' do
    it "has a version number" do
      expect(Txt2tenji::VERSION).not_to be nil
    end
  end

  describe '#generate' do
    context '清音' do
      it "ア行" do
        expect(Txt2tenji::generate('A I')).to eq("●- ●-\n-- ●-\n-- --")
      end
    end
  end
end
