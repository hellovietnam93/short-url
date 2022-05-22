# frozen_string_literal: true

module RescueExceptions
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    rescue_from ActionController::ParameterMissing do |error|
      render_invalid_params_response error
    end
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_resource_not_found_response
    rescue_from Api::Error::InvalidUrl, with: :invalid_url_render_options
    rescue_from Api::Error::InvalidShortUrl, with: :invalid_short_url_render_options

    ###############################
    ########## protected ##########
    ###############################

    protected

    def render_invalid_params_response error, status: :ok
      error = Api::Error::InvalidParamster.new id: error.param
      render json: error.to_hash, status: status
    end

    def render_unprocessable_entity_response exception, status: :ok
      error = ActiveRecordValidation::Error.new record: exception.record
      render json: error.to_hash, status: status
    end

    def render_resource_not_found_response exception, status: :not_found
      error = Api::Error::RecordNotFound.new error: exception
      render json: error.to_hash, status: status
    end

    def invalid_url_render_options
      error = Api::Error::InvalidUrl.new
      render json: error.to_hash, status: :bad_request
    end

    def invalid_short_url_render_options
      error = Api::Error::InvalidShortUrl.new
      render json: error.to_hash, status: :bad_request
    end
  end
end
