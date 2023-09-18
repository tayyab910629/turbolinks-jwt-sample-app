ShopifyApp.configure do |config|
  ShopifyAPI::Base.site = "https://testappruby.myshopify.com" # Use an environment variable for the shop name
  config.application_name = "test ruby app"
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_API_SECRET']
  config.old_secret = ""
  config.api_version = "2020-04"
  config.scope = "read_products, read_orders, read_customers,write_orders" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.reauth_on_access_scope_changes = true
  config.embedded_app = true
  config.after_authenticate_job = false

  config.shop_session_repository = 'Shop'
  config.allow_jwt_authentication = true
  config.webhooks = [
    # {topic: 'app/uninstalled', address: "#{ENV['APP_URL']}/webhooks/app_uninstalled", format: 'json'},
    {topic: 'orders/create', address: "#{ENV['APP_URL']}/orders/orders_create", format: 'json'}
  ]
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
