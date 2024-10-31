require 'rails_helper'

RSpec.describe User, type: :model do
  it 'メール、パスワードがあれば有効であること' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'メールはユニークであること' do
    user1 = create(:user)
    user2 = build(:user)
    user2.email = user1.email
    user2.valid?
    expect(user2.errors[:email]).to include('このメールアドレスはすでに使用されています')
  end

  it 'メールアドレスは必須項目であること' do
    user = build(:user)
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("メールアドレスを入力してください")
  end
end