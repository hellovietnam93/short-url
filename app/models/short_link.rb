# frozen_string_literal: true

class ShortLink
  def initialize args = {}
    @url = args[:url]
  end

  ###
  # constants
  VALID_SLUG = %r{^/s/[\w|\-D]+/?$}

  attr_reader :uri, :url

  def is_valid_url?
    @uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def is_valid_shortern_url?
    uri.host == ENV["APP_HOST"] && uri.path.match?(VALID_SLUG)
  end

  def slug
    return unless is_valid_url?
    return unless is_valid_shortern_url?

    uri.path.split("/").last
  end
end
