class DonationListController < ApplicationController
  before_action :set_user, only: [:new_card, :create_card]

  def index
    @users = User.all
  end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def create_card
    respond_to do |format|
      token = params[:stripeToken]

      charge = Stripe::Charge.create({
          customer: @user.stripe_id,
          amount: 999,
          currency: 'usd',
          description: 'Example charge',
          source: token,
          capture: false,
        })
      format.html { redirect_to donation_list_index_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end
end
