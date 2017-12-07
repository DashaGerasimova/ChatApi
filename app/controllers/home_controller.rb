class HomeController < ApplicationController
  include Secured

  def index
    render json: {'logged_in' => true}
  end
end