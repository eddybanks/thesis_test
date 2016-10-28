class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit
end

ActionController::Renderers.add :json do |json, options|
  unless json.kind_of?(String)
    json = json.as_json(options) if json.respond_to?(:as_json)
    json = JSON.pretty_generate(json, options)
  end
  self.content_type ||= Mime::JSON
  json
end
