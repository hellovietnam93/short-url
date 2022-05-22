# frozen_string_literal: true

require "rails_helper"

RSpec.describe LinksController, type: :controller do # rubocop:disable Metrics/BlockLength
  let(:response_body) { JSON.parse(response.body, symbolize_names: true) }

  describe "GET #index" do
    context "list all links" do
      before do
        create_list :link, 10, url: "https://rubygems.org"
      end

      it do
        get :index

        expect(response.status).to eq 200
        expect(response_body[:data].count).to eq 10
      end
    end
  end

  describe "POST #create" do # rubocop:disable Metrics/BlockLength
    context "create fails" do # rubocop:disable Metrics/BlockLength
      context "paramster missing" do
        let(:params) do
          {
            url: "https://rubygems.org"
          }
        end

        it do
          post :create, params: params
          expect(response.status).to eq 200
          expect(response_body[:success]).to eq false
          expect(response_body[:errors].first[:id]).to eq "link"
          expect(response_body[:errors].first[:message]).to eq "params is missing or the value is empty: link"
        end
      end

      context "validation fails" do
        let(:params) do
          {
            url: "https://rubygems.org" * 200
          }
        end

        it do
          post :create, params: { link: params }
          expect(response.status).to eq 200
          expect(response_body[:success]).to eq false
          expect(response_body[:errors].first[:id]).to eq "link"
          expect(response_body[:errors].first[:field]).to eq "url"
          expect(response_body[:errors].first[:message]).to eq "Url is too long (maximum is 255 characters)"
        end
      end
    end

    context "create success" do
      let(:params) do
        {
          url: "https://rubygems.org"
        }
      end

      it do
        post :create, params: { link: params }

        link = Link.find_by url: params[:url]

        expect(response.status).to eq 200
        expect(response_body[:data][:id]).to eq link.id.to_s
        expect(response_body[:data][:attributes][:url]).to eq params[:url]
        expect(response_body[:data][:attributes][:short]).to eq link.short
      end
    end
  end

  describe "GET #show" do
    context "slug not found" do
      it do
        get :show, params: { slug: "NOT_FOUND" }

        expect(response.status).to eq 404
        expect(response_body[:success]).to eq false
        expect(response_body[:errors].first[:id]).to eq "link"
        expect(response_body[:errors].first[:message]).to eq "link not found"
      end
    end

    context "slug is existed" do
      let(:link) { create :link, url: "https://rubygems.org" }

      it do
        get :show, params: { slug: link.slug }

        expect(response.status).to eq 302
        expect(link.reload.clicked).to eq 1
        expect(subject).to redirect_to link.url
      end
    end
  end

  describe "GET #decode" do # rubocop:disable Metrics/BlockLength
    context "url invalid" do
      before do
        allow_any_instance_of(ShortLink).to receive(:is_valid_url?).and_return(false)
      end

      it do
        get :decode, params: { url: "http://#{ENV['APP_HOST']}:3000/s/8eb561" }

        expect(response.status).to eq 400
        expect(response_body[:success]).to eq false
        expect(response_body[:errors].first[:id]).to eq "Url"
        expect(response_body[:errors].first[:message]).to eq "Url is invalid."
      end
    end

    context "short url invalid" do
      before do
        allow_any_instance_of(ShortLink).to receive(:is_valid_shortern_url?).and_return(false)
      end

      it do
        get :decode, params: { url: "http://#{ENV['APP_HOST']}:3000/s/8eb561" }

        expect(response.status).to eq 400
        expect(response_body[:success]).to eq false
        expect(response_body[:errors].first[:id]).to eq "Short Url"
        expect(response_body[:errors].first[:message]).to eq "Short Url is invalid."
      end
    end

    context "short url with slug not found" do
      it do
        get :decode, params: { url: "http://#{ENV['APP_HOST']}:3000/s/8eb561" }

        expect(response.status).to eq 404
        expect(response_body[:success]).to eq false
        expect(response_body[:errors].first[:id]).to eq "link"
        expect(response_body[:errors].first[:message]).to eq "link not found"
      end
    end

    context "slug is existed" do
      let(:link) { create :link, url: "https://rubygems.org" }

      it do
        get :decode, params: { url: link.short }

        expect(response.status).to eq 200
        expect(response_body[:data][:id]).to eq link.id.to_s
        expect(response_body[:data][:attributes][:url]).to eq link.url
        expect(link.reload.clicked).to eq 1
        expect(response_body[:data][:attributes][:short]).to eq link.short
      end
    end
  end
end
