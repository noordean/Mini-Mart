# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ExceptionHandler
  protect_from_forgery with: :null_session

  def current_user
    token = request.headers["HTTP_TOKEN"]
    User.find(JsonWebToken.decode(token)[:user_id]) if token
  end
end
