require 'rails_helper'

describe User do
  describe '#from_google' do
    let(:user_info) { double(:user_info,
                             emails: [double(:email, value: 'email')],
                             display_name: 'name',
                             image: double(:image, url: 'image_url'),
                             id: 'google_id') }
    it 'creates or load the correct user' do
      user = User.from_google(user_info)
      expect(user.email).to eq 'email'
      expect(user.name).to eq 'name'
      expect(user.image_url).to eq 'image_url'
      expect(user.google_id).to eq 'google_id'
      user2 = User.from_google(user_info)
      expect(user).to eq user2
    end
  end
end
