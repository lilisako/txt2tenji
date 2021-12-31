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
        expect(Txt2tenji::generate_txt('A I U E O')).to eq("●- ●- ●● ●● -●\n-- ●- -- ●- ●-\n-- -- -- -- --")
      end

      it "カ行" do
        expect(Txt2tenji::generate_txt('KA KI KU KE KO')).to eq("●- ●- ●● ●● -●\n-- ●- -- ●- ●-\n-● -● -● -● -●")
      end

      it "サ行" do
        expect(Txt2tenji::generate_txt('SA SI SU SE SO')).to eq("●- ●- ●● ●● -●\n-● ●● -● ●● ●●\n-● -● -● -● -●")
      end

      it "タ行" do
        expect(Txt2tenji::generate_txt('TA TI TU TE TO')).to eq("●- ●- ●● ●● -●\n-● ●● -● ●● ●●\n●- ●- ●- ●- ●-")
        expect(Txt2tenji::generate_txt('CHI')).to eq("●-\n●●\n●-")
      end

      it "ナ行" do
        expect(Txt2tenji::generate_txt('NA NI NU NE NO')).to eq("●- ●- ●● ●● -●\n-- ●- -- ●- ●-\n●- ●- ●- ●- ●-")
      end

      it "ハ行" do
        expect(Txt2tenji::generate_txt('HA HI HU HE HO')).to eq("●- ●- ●● ●● -●\n-- ●- -- ●- ●-\n●● ●● ●● ●● ●●")
      end

      it "マ行" do
        expect(Txt2tenji::generate_txt('MA MI MU ME MO')).to eq("●- ●- ●● ●● -●\n-● ●● -● ●● ●●\n●● ●● ●● ●● ●●")
      end

      it "ラ行" do
        expect(Txt2tenji::generate_txt('RA RI RU RE RO')).to eq("●- ●- ●● ●● -●\n-● ●● -● ●● ●●\n-- -- -- -- --")
      end

      it "ヤ行" do
        expect(Txt2tenji::generate_txt('YA YU YO')).to eq("-● -● -●\n-- -- -●\n●- ●● ●-")
      end

      it "ワ行" do
        expect(Txt2tenji::generate_txt('WA')).to eq("--\n--\n●-")
        expect(Txt2tenji::generate_txt('N')).to eq("--\n-●\n●●")
      end

      it "小さいつ" do
        expect(Txt2tenji::generate_txt('KI TTE')).to eq("●- -- ●●\n●- ●- ●●\n-● -- ●-")
        expect(Txt2tenji::generate_txt('I PPA I')).to eq("●- -- -- ●- ●-\n●- ●- -- -- ●-\n-- -- -● ●● --")
        expect(Txt2tenji::generate_txt('RA PPU')).to eq("●- -- -- ●●\n-● ●- -- --\n-- -- -● ●●")
      end
    end

    context '濁音' do
      it "ガ行" do
        expect(Txt2tenji::generate_txt('GA GI GU')).to eq("-- ●- -- ●- -- ●●\n-● -- -● ●- -● --\n-- -● -- -● -- -●")
      end

      it "ザ行" do
        expect(Txt2tenji::generate_txt('ZA ZI ZU')).to eq("-- ●- -- ●- -- ●●\n-● -● -● ●● -● -●\n-- -● -- -● -- -●")
      end

      it "ダ行" do
        expect(Txt2tenji::generate_txt('DA DI DU')).to eq("-- ●- -- ●- -- ●●\n-● -● -● ●● -● -●\n-- ●- -- ●- -- ●-")
      end

      it "バ行" do
        expect(Txt2tenji::generate_txt('BA BI BU')).to eq("-- ●- -- ●- -- ●●\n-● -- -● ●- -● --\n-- ●● -- ●● -- ●●")
      end
    end

    context '半濁音' do
      it "パ行" do
        expect(Txt2tenji::generate_txt('PA PI PU')).to eq("-- ●- -- ●- -- ●●\n-- -- -- ●- -- --\n-● ●● -● ●● -● ●●")
      end
    end

    context '小さいや・ゆ・よ' do
      it "カ行" do
        expect(Txt2tenji::generate_txt('KYA KYU KYO')).to eq("-● ●- -● ●● -● -●\n-- -- -- -- -- ●-\n-- -● -- -● -- -●")
      end

      it "サ行" do
        expect(Txt2tenji::generate_txt('SHA SHU SHO')).to eq("-● ●- -● ●● -● -●\n-- -● -- -● -- ●●\n-- -● -- -● -- -●")
      end

      it "タ行" do
        expect(Txt2tenji::generate_txt('CHA CHU CHO')).to eq("-● ●- -● ●● -● -●\n-- -● -- -● -- ●●\n-- ●- -- ●- -- ●-")
      end

      it "ナ行" do
        expect(Txt2tenji::generate_txt('NYA NYU NYO')).to eq("-● ●- -● ●● -● -●\n-- -- -- -- -- ●-\n-- ●- -- ●- -- ●-")
      end

      it "ハ行" do
        expect(Txt2tenji::generate_txt('HYA HYU HYO')).to eq("-● ●- -● ●● -● -●\n-- -- -- -- -- ●-\n-- ●● -- ●● -- ●●")
      end

      it "マ行" do
        expect(Txt2tenji::generate_txt('MYA MYU MYO')).to eq("-● ●- -● ●● -● -●\n-- -● -- -● -- ●●\n-- ●● -- ●● -- ●●")
      end

      it "ラ行" do
        expect(Txt2tenji::generate_txt('RYA RYU RYO')).to eq("-● ●- -● ●● -● -●\n-- -● -- -● -- ●●\n-- -- -- -- -- --")
      end

      it "ガ行" do
        expect(Txt2tenji::generate_txt('GYA GYU GYO')).to eq("-● ●- -● ●● -● -●\n-● -- -● -- -● ●-\n-- -● -- -● -- -●")
      end

      it "ザ行" do
        expect(Txt2tenji::generate_txt('JA JU JO')).to eq("-● ●- -● ●● -● -●\n-● -● -● -● -● ●●\n-- -● -- -● -- -●")
      end

      it "ダ行" do
        expect(Txt2tenji::generate_txt('DYA DYU DYO')).to eq("-● ●- -● ●● -● -●\n-● -● -● -● -● ●●\n-- ●- -- ●- -- ●-")
      end

      it "バ行" do
        expect(Txt2tenji::generate_txt('BYA BYU BYO')).to eq("-● ●- -● ●● -● -●\n-● -- -● -- -● ●-\n-- ●● -- ●● -- ●●")
      end

      it "パ行" do
        expect(Txt2tenji::generate_txt('PYA PYU PYO')).to eq("-● ●- -● ●● -● -●\n-- -- -- -- -- ●-\n-● ●● -● ●● -● ●●")
      end
    end

    context '対応する点字がない場合' do
      it "英語" do
        expect{Txt2tenji::generate_txt('ERROR')}.to raise_error(ArgumentError, "Could not find the corresponding Tenji / 対応する点字を見つけることができませんでした")
      end

      it '小文字' do
        expect(Txt2tenji::generate_txt('ga gi gu')).to eq("-- ●- -- ●- -- ●●\n-● -- -● ●- -● --\n-- -● -- -● -- -●")
        expect(Txt2tenji::generate_txt('pya pyu pyo')).to eq("-● ●- -● ●● -● -●\n-- -- -- -- -- ●-\n-● ●● -● ●● -● ●●")
      end
    end
  end
end
