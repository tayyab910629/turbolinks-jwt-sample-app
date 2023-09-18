class CustomsController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification

  def show
    session = ShopifyAPI::Session.new(domain: "https://testappruby.myshopify.com", token: Shop.first.shopify_token, api_version:  "2019-10")
    ShopifyAPI::Base.activate_session(session)
    @product = ShopifyAPI::Product.find(params[:id])
  end
end
