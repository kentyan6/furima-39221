require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "family_name、last_name、family_kana、last_kana、とemail、passwordとpassword_confirmation、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test1234'
        @user.password_confirmation = 'test1234'
        expect(@user).to be_valid
      end
      it 'family_nameとlast_nameが全角であれば登録できる' do
        @user.family_name = '雅美'
        @user.last_name = 'ママ'
        expect(@user).to be_valid
      end
      it 'family_kanaとlast_kanaが全角であれば登録できる' do
        @user.family_kana = 'ルル'
        @user.last_kana = 'オイ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "family_kanaが空では登録できない" do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it "last_kanaが空では登録できない" do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = '中ﾊﾗ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end      
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'まつﾗ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end      
      it '姓（カナ）に平仮名が含まれていると登録できない' do
        @user.family_kana = 'まル'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it '名（カナ）に平仮名が含まれていると登録できない' do
        @user.last_kana = 'ミつ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end
      it '姓（カナ）に漢字が含まれていると登録できない' do
        @user.family_kana = '川ル'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it '名（カナ）に漢字が含まれていると登録できない' do
        @user.last_kana = 'ミ歩'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end
      it '姓（カナ）に英数字が含まれていると登録できない' do
        @user.family_kana = '2ル'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it '名（カナ）に英数字が含まれていると登録できない' do
        @user.last_kana = 'ミ6'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end
      it '姓（カナ）に記号が含まれていると登録できない' do
        @user.family_kana = '^ル'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family kana is invalid')
      end
      it '名（カナ）に記号が含まれていると登録できない' do
        @user.last_kana = 'ミ@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが英数字混合でも6文字未満なら登録できない' do
        @user.password ='test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password ='11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
