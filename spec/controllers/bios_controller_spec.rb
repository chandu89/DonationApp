require 'rails_helper'

RSpec.describe BiosController, type: :controller do
  let(:user) { FactoryGirl.create(:user, :with_bios) }
  login_user
  describe '#index' do
    context 'returns all the bios' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it 'returns a 200 (Ok)' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all the bios' do
        expect(JSON.parse(response.body).collect { |a| a['Bio'] }).to eq(user.bios.map(&:Bio))
      end
    end
  end

  describe '#create' do
    context 'when accessing create via POST' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        post :create, params: { bio: { Bio: 'First Bio' } }
      end

      it 'returns a 201 (Created)' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when incorrect parameters are passed' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        post :create, params: { bio: { Bio: '' } }
      end

      it 'returns a 400 (Bad Request)' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
