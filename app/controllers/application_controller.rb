class ApplicationController < ActionController::Base
  def default_url_options
    { host: ENV["www.perfect-watch.net"] || "localhost:3000" }
  end
end
