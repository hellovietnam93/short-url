# frozen_string_literal: true

class LinksController < ApplicationController
  def index
    links = Link.all
    # TODO
    # Add link to cache to query faster
    render_jsonapi links
  end

  def create
    link = Link.create! link_params
    # TODO
    # Add link to cache to query faster
    render_jsonapi link
  end

  def show
    link = Link.find_by! slug: params[:slug]
    # TODO
    # Get link from cache for better performance
    link.update_attribute(:clicked, link.clicked + 1)
    redirect_to link.url, allow_other_host: true
  end

  def decode
    short_link = ::ShortLink.new url: params[:url]
    raise ::Api::Error::InvalidUrl unless short_link.is_valid_url?
    raise ::Api::Error::InvalidShortUrl unless short_link.is_valid_shortern_url?

    # TODO
    # Get link from cache for better performance
    link = Link.find_by! slug: short_link.slug
    link.update_attribute(:clicked, link.clicked + 1)
    render_jsonapi link
  end

  ###############################
  ############ private ##########
  ###############################

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
