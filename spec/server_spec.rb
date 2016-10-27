require './server.rb'
require 'rspec'
require 'rack/test'

describe "Sinatra Blog" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "Home page" do
    it "is shown" do
      get '/'
      expect(last_response).to be_ok
    end
  end 
end

