class DonationListController < ApplicationController
  def index
    @users = User.all
  end
end
