class WelcomeController < ApplicationController
  def index
  end

  def greatestgood
    @root_url = "http://greatestgood.org/"
    @data = JSON.parse `curl http://api.greatestgood.org/advisor`
  end
end
