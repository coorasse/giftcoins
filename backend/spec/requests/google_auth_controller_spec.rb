require 'rails_helper'

describe Api::V1::GoogleAuthController, type: :request do
  describe '#create' do
    let(:user) { User.create!(email: 'alessandro', google_id: 'google_id') }
    context 'no code param is given' do
      it 'returns forbidden' do
        post api_v1_token_path
        expect(response).to have_http_status :forbidden
      end
    end
    context 'correct authentication' do
      before do
        allow(GoogleAuthenticator).to receive_message_chain(:user_info, :get_person).and_return({})
        allow(User).to receive(:from_google).and_return(user)
      end
      it 'returns correct user information' do
        post api_v1_token_path(code: 'hello')
        expect(response.body).to eq({ access_token: JsonWebTokenService.encode(user_id: user.id), user: user }.to_json)
        expect(response).to have_http_status :success
      end
    end
  end
end
