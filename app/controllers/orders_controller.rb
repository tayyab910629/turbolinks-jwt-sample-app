class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:orders_create]

    def index
        @shopify_params = params.slice(:embedded, :hmac, :host, :locale, :session, :shop, :timestamp)
        
        shop = current_shop
        session = ShopifyAPI::Session.new(domain: shop.shopify_domain, token: shop.shopify_token, api_version: '2022-10') # Adjust API version accordingly
        ShopifyAPI::Base.activate_session(session)
        
        @orders = ShopifyAPI::Order.all
      end

      def orders_create
        # Your logic to handle the webhook data goes here.
    # For now, just rendering a plain response for testing:
    render plain: 'Received webhook', status: :ok
      end
      

      private

    def current_shop
        Shop.find_by(shopify_domain: @shopify_params[:shop])
    end

      
end


