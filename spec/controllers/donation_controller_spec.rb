require 'rails_helper'

RSpec.describe DonationController, type: :controller do
  let(:user) { FactoryGirl.create(:user, :with_bios) }
  login_user

  describe '#new_card' do
    context 'returns new card js' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :new_card, format: 'js'
      end

      it 'returns a 200 (Ok)' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#create_card' do
    Stripe.api_key = Rails.application.credentials.stripe[:development][:secret_key]
    let(:card_token) do
      Stripe::Token.create(
        card: {
          number: '4242424242424242',
          exp_month: 3,
          exp_year: 2021,
          cvc: '314'
        }
      )
    end
    context 'when accessing create via POST' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        post :create_card,  params: { stripeToken: card_token.id }, format: 'html'
      end

      it 'returns a 201 (Created)' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when incorrect parameters are passed' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
      end

      it 'returns a 400 (Bad Request)' do
        expect do
          post :create_card, params: { stripeToken: '1111' }, format: 'html'
        end.to raise_error(Stripe::InvalidRequestError)
      end
    end
  end
end
