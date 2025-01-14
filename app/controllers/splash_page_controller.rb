class SplashPageController < ApplicationController
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification

  def index
    session = ShopifyAPI::Session.new(domain: "https://testappruby.myshopify.com", token: Shop.first.shopify_token, api_version:  "2019-10")
    ShopifyAPI::Base.activate_session(session)
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  end
end
