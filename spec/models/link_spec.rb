# frozen_string_literal: true

require "rails_helper"

RSpec.describe Link, type: :model do # rubocop:disable Metrics/BlockLength
  describe "validations" do
    # url
    it { should validate_presence_of(:url) }
    it { should validate_length_of(:url).is_at_least(3).is_at_most(255) }
    it { should allow_value("https://rubygems.org/").for(:url) }
    it { should allow_value("http://rubygems.org/").for(:url) }
    it { should_not allow_value("rubygems.org").for(:url) }

    # slug
    it { should validate_uniqueness_of(:slug) }
    it { should validate_length_of(:slug).is_at_least(3).is_at_most(255) }
  end

  describe ".short" do
    let(:link) { create :link }

    it "return short link" do
      expect(link.short).to eq "https://#{ENV['APP_HOST']}:3000/s/#{link.slug}"
    end
  end

  describe "callbacks" do
    context "generate slug when slug empty" do
      let(:link) { create :link }

      it do
        expect(link.slug.blank?).to eq false
      end
    end

    context "not generate slug when slug present" do
      let(:link) { create :link, slug: "123456" }

      it do
        expect(link.slug).to eq "123456"
      end
    end
  end
end
