require 'rails_helper'

RSpec.describe JsonWebTokenService do
  let(:data) { { user: 'user' } }
  let(:encoded) { JsonWebTokenService.encode(data) }
  let(:decoded) { JsonWebTokenService.decode(encoded) }

  it 'can encode' do
    expect(encoded).to be_a String
  end

  it 'can decode' do
    expect(decoded[:user]).to eq 'user'
  end
end
