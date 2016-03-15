require "tilt"
require "rack/protection"
require "hobbit"
require "hobbit/contrib"
require "dotenv"

Dotenv.load

require_relative "config/database"

Dir["./lib/**/*.rb"].each     { |f| require f }
Dir["./models/**/*.rb"].each   { |f| require f }
Dir["./services/**/*.rb"].each { |f| require f }

class App < Hobbit::Base
  include Hobbit::Render

  use Rack::Session::Cookie, key: ENV["COOKIE_KEY"],
                             secret: ENV["COOKIE_SECRET"]
  use Rack::MethodOverride
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  use Rack::Static, root: "public",
                    urls: ["/javascripts", "/stylesheets", "/images"]

  get "/" do
    render "index"
  end
end
