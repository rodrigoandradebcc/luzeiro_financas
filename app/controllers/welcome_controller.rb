class WelcomeController < ApplicationController
  def index
    @enterprises = Enterprise.all
  end
end
