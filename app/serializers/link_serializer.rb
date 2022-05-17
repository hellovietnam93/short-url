# frozen_string_literal: true

class LinkSerializer
  include JSONAPI::Serializer
  attributes :url, :short, :clicked
end
