class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_home_module
  def index
  end
end
