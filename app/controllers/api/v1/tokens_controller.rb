class Api::V1::TokensController < ApplicationController
  before_filter :authenticate_user!

  def index
    user = User.find(current_user)
    render json: { token: user.auth_token }
  end

end
