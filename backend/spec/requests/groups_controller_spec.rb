require 'rails_helper'

describe Api::V1::GroupsController, type: :request do
  describe '#index' do
    let(:user) { User.create!(email: 'alessandro', google_id: 'google_id') }
    context 'no authentication is performed' do
      it 'returns forbidden' do
        get api_v1_groups_path
        expect(response).to have_http_status :unauthorized
      end
    end

    context 'correct authentication' do
      before do
        allow_any_instance_of(described_class).to receive(:valid_token?).and_return(true)
        allow_any_instance_of(described_class).to receive(:auth_token).and_return({ user_id: user.id })
      end
      it 'returns the list of groups' do
        get api_v1_groups_path
        expect(response.body).to eq([{ name: 'hello' }, { name: 'world' }].to_json)
        expect(response).to have_http_status :success
      end
    end
  end
end
