# frozen_string_literal: true

class HomesController < ApplicationController
  def index
    render json: { document: "#{Rails.application.routes.url_helpers.root_url(protocol: 'https')}doc/index.html" }
  end
end
