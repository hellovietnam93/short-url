# frozen_string_literal: true

module Api
  class BaseError < StandardError
    attr_reader :id, :message

    def serialize
      [ { id: id, message: message } ]
    end

    def to_hash
      {
        success: false,
        errors: serialize
      }
    end
  end
end
