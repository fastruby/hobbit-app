require "erb"
require "rack/protection"
require "hobbit"
require "dotenv"

Dotenv.load

require_relative "config/database"

Dir["./lib/**/*.rb"].each     { |f| require f }
Dir["./models/**/*.rb"].each   { |f| require f }
Dir["./services/**/*.rb"].each { |f| require f }

class App < Hobbit::Base
  use Rack::Session::Cookie, key: ENV["COOKIE_KEY"],
                             secret: ENV["COOKIE_SECRET"]
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  use Rack::Static, root: "public",
                    urls: ["/javascripts", "/stylesheets", "/images"]

  get "/" do
    "Hello, World!"
  end
end
