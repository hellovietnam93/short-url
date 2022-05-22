# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JsonRender
  include RescueExceptions
end
