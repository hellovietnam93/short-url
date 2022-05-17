# frozen_string_literal: true

class ValidationErrorSerializer
  def initialize record, field, details, message
    @record = record
    @field = field
    @details = details
    @message = message
  end

  def serialize
    {
      id: resource,
      field: field,
      message: message
    }
  end

  ###############################
  ############ private ##########
  ###############################

  private

  attr_reader :record, :message

  def resource
    I18n.t underscored_resource_name, scope: [ :errors, :resources ], default: underscored_resource_name
  end

  def field
    I18n.t @field, scope: [ :errors, :fields, underscored_resource_name ], default: @field.to_s
  end

  def underscored_resource_name
    record.class.to_s.gsub("::", "").underscore
  end
end
