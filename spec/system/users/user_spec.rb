require 'rails_helper'

RSpec.describe 'ユーザー登録', type: :system do

  context '入力情報正常系' do
    it 'ユーザーが新規作成できること' do
      visit '/users/new'
      fill_in 'メールアドレス', with: 'example@example.com'
      fill_in 'パスワード', with: '12345678'
      fill_in 'パスワード確認', with: '12345678'
      click_button '登録'
      expect(page).to have_content 'ユーザー登録が完了しました'
      expect(current_path).to eq root_path
    end
  end

  context '入力情報異常系' do
    it 'ユーザーが新規作成できない' do
      visit '/users/new'
      fill_in 'メールアドレス', with: 'example@example.com'
      click_button '登録'
      expect(page).to have_content 'ユーザー登録に失敗しました'
      expect(page).to have_content "パスワードを入力してください"
      expect(current_path).to eq users_path
    end
  end
end