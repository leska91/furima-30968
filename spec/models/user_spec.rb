require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it 'passwordが6文字以上なら登録できる' do
        @user.password = 'tete22'
        @user.password_confirmation = 'tete22'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠が含まれない場合は登録できない' do
        @user.email = 'mayutest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英数字混合にしてください')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英数字混合にしてください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe '新規登録/本人情報確認' do
    context '新規登録できるとき' do
      it 'ユーザー本名に苗字と名前が全角（漢字・ひらがな・カタカナ）で、且つ、生年月日が入力されていると登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'ユーザー本名の苗字が空のときは登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'ユーザー本名の名前が空のときは登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it '苗字に全角漢字・ひらがながないときは登録できない' do
        @user.last_name_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanji は全角文字を使用してください')
      end
      it '名前に全角漢字・ひらがながないときは登録できない' do
        @user.first_name_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanji は全角文字を使用してください')
      end
      it 'ユーザー本名の苗字フリガナが空のときは登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名の名前フリガナが空のときは登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '苗字フリガナが全角カタカナでないときは登録できない' do
        @user.last_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナを使用してください')
      end
      it '名前フリガナが全角カタカナでないときは登録できない' do
        @user.first_name_kana = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナを使用してください')
      end
      it '生年月日が空のときは登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
