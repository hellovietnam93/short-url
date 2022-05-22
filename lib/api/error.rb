# frozen_string_literal: true

module Api
  module Error
    class RecordNotFound < BaseError
      attr_reader :error

      def initialize errors = {}
        @error = errors[:error]
        @id = error.model.underscore
        @message = I18n.t("errors.records.not_found", resource: id)
      end
    end

    class InvalidParamster < BaseError
      def initialize errors = {}
        @id = errors[:id]
        @message = I18n.t("errors.params.invalid", param: id)
      end
    end

    class InvalidUrl < BaseError
      def initialize
        @id = SettingErrors.links.invalid_url
        @message = I18n.t("errors.links.invalid_url")
      end
    end

    class InvalidShortUrl < BaseError
      def initialize
        @id = SettingErrors.links.invalid_short_url
        @message = I18n.t("errors.links.invalid_short_url")
      end
    end
  end
end
