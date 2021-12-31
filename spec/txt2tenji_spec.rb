# frozen_string_literal: true

RSpec.describe Txt2tenji do
  describe 'VERSION' do
    it "has a version number" do
      expect(Txt2tenji::VERSION).not_to be nil
    end
  end

  describe '#generate_txt' do
    context '清音' do
      it "ア行" do
        expect(Txt2tenji::generate_txt('A I')).to eq("●- ●-\n-- ●-\n-- --")
      end
    end

    context '濁音' do
      it "ガ行" do
        expect(Txt2tenji::generate_txt('GA GI GU')).to eq("-- ●- -- ●- -- ●●\n-● -- -● ●- -● --\n-- -● -- -● -- -●")
      end
    end

    context '小さいや・ゆ・よ' do
      it "サ行" do
        expect(Txt2tenji::generate_txt('SHA SHU SHO')).to eq("-● ●- -● ●● -● -●\n-- -● -- -● -- ●●\n-- -● -- -● -- -●")
      end
    end
  end
end
