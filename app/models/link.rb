# frozen_string_literal: true

class Link < ApplicationRecord
  ###
  # associations
  validates :url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w(http https)), length: { in: 3..255 }
  validates :slug, uniqueness: true, length: { in: 3..255 }

  ###
  # callbacks
  before_validation :set_slug, if: :require_generate_slug?

  def short
    Rails.application.routes.url_helpers.short_url(slug: slug)
  end

  ###############################
  ############ private ##########
  ###############################

  private

  def set_slug
    self.slug = generate_slug
  end

  def generate_slug
    loop do
      slug = SecureRandom.uuid[0..5]

      break slug unless Link.where(slug: slug).exists?
    end
  end

  def require_generate_slug?
    slug.blank?
  end
end
