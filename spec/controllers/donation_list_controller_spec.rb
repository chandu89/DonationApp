require 'rails_helper'

RSpec.describe DonationListController, type: :controller do
  let(:user) { FactoryGirl.create(:user, :with_bios) }
  login_user

  describe '#index' do
    context 'returns all the users' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :index
      end

      it 'returns a 200 (Ok)' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns all the users' do
        expect(JSON.parse(response.body).collect { |a| a['email'] }).to eq(User.all.map(&:email))
      end
    end
  end

  describe '#new_card' do
    context 'returns new card js' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        request.env['HTTP_ACCEPT'] = 'application/json'
        get :new_card, format: 'js', params: {user_id: user.id}
      end

      it 'returns a 200 (Ok)' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  # This is code i need to fix and i am truggling till now
  # describe '#create_card' do
  #   Stripe.api_key = Rails.application.credentials.stripe[:development][:secret_key]
  #   let(:card_token) do
  #     Stripe::Token.create(
  #       card: {
  #         number: '4242424242424242',
  #         exp_month: 3,
  #         exp_year: 2021,
  #         cvc: '314'
  #       }
  #     )
  #   end
  #   context 'when accessing create via POST' do
  #     before do
  #       allow(controller).to receive(:current_user).and_return(user)
  #       request.env['HTTP_ACCEPT'] = 'application/json'
  #       post :create_card,  params: { stripeToken: card_token.id, user_id: user.id }, format: 'html'
  #     end
  #
  #     it 'returns a 201 (Created)' do
  #       expect(response).to have_http_status(:created)
  #     end
  #   end
  #
  #   context 'when incorrect parameters are passed' do
  #     before do
  #       allow(controller).to receive(:current_user).and_return(user)
  #       request.env['HTTP_ACCEPT'] = 'application/json'
  #     end
  #
  #     it 'returns a 400 (Bad Request)' do
  #       expect do
  #         post :create_card, params: { stripeToken: '1111', user_id: user.id }, format: 'html'
  #       end.to raise_error(Stripe::InvalidRequestError)
  #     end
  #   end
  # end
end
