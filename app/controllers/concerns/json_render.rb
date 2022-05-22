# frozen_string_literal: true

module JsonRender
  extend ActiveSupport::Concern

  class DataSanitizer
    def initialize object, options
      @object = object
      @options = options
    end

    def sanitize
      sanitized_data
    end

    ###############################
    ############ private ##########
    ###############################

    private

    attr_reader :object, :options

    def sanitized_data
      @sanitized_data ||= serializer.new object, opts
    end

    def klass_name
      @klass_name ||= (object.respond_to?(:klass) ? object.klass : object.class).name
    end

    def serializer
      @serializer ||= options[:serializer] || "#{klass_name}Serializer".constantize
    end

    def opts
      @opts ||= options.except(:success, :status, :meta)
    end
  end

  protected

  included do
    def render_jsonapi object, options = {}
      data_serializer = DataSanitizer.new(object, options).sanitize.serializable_hash
      render json: data_serializer, status: status
    end
  end
end
