# frozen_string_literal: true

require "rails_helper"

RSpec.shared_examples "not valid url" do
  context "not valid url" do
    it do
      expect(short_link.is_valid_url?).to eq false
    end
  end
end

RSpec.shared_examples "not valid short url" do
  context "not valid short url" do
    it do
      expect(short_link.is_valid_shortern_url?).to eq false
    end
  end
end

RSpec.shared_examples "valid slug" do
  context "valid slug" do
    it do
      expect(short_link.slug).to eq slug
    end
  end
end

RSpec.shared_examples "invalid slug" do
  context "invalid slug" do
    it do
      expect(short_link.slug).to eq nil
    end
  end
end

RSpec.describe ShortLink do # rubocop:disable Metrics/BlockLength
  subject(:short_link) { described_class.new(url: url) }

  describe ".is_valid_url?" do
    context "does not have host" do
      let(:url) { "rubygems.org" }

      include_examples("not valid url")
    end

    context "invalid scheme" do
      let(:url) { "httsp://rubygems.org" }

      include_examples("not valid url")
    end

    context "raise exception" do
      before do
        allow(URI).to receive(:parse).with(url).and_raise URI::InvalidURIError
      end
      let(:url) { "http://rubygems.org" }

      include_examples("not valid url")
    end
  end

  describe ".is_valid_shortern_url?" do
    before do
      short_link.is_valid_url?
    end

    context "host does not match" do
      let(:url) { "https://rubygems.org/s/8eb561" }

      include_examples("not valid short url")
    end

    context "path does not include partern s" do
      let(:url) { "http://#{ENV['APP_HOST']}:3000/x/8eb561" }

      include_examples("not valid short url")
    end

    context "slug does not have valid format" do
      let(:url) { "http://#{ENV['APP_HOST']}:3000/s/8eb561/x" }

      include_examples("not valid short url")
    end
  end

  describe ".slug" do
    context "valid slug format" do
      let(:slug) { "8eb561" }
      let(:url) { "http://#{ENV['APP_HOST']}:3000/s/#{slug}" }

      include_examples("valid slug")
    end

    context "invalid url format" do
      let(:slug) { "8eb561" }
      let(:url) { "httsp://#{ENV['APP_HOST']}:3000/s/#{slug}" }

      include_examples("invalid slug")
    end

    context "invalid short url format" do
      let(:slug) { "8eb561" }
      let(:url) { "http://#{ENV['APP_HOST']}:3000/x/#{slug}" }

      include_examples("invalid slug")
    end
  end
end
