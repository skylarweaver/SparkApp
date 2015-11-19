# config/initializers/simple_token_authentication.rb

SimpleTokenAuthentication.configure do |config|

  # Configure the session persistence policy after a successful sign in,
  # in other words, if the authentication token acts as a signin token.
  # If true, user is stored in the session and the authentication token and
  # email may be provided only once.
  # If false, users must provide their authentication token and email at every request.
  config.sign_in_token = true

  # Configure the name of the HTTP headers watched for authentication.
  #
  # Default header names for a given token authenticatable entity follow the pattern:
  #   { entity: { authentication_token: 'X-Entity-Token', email: 'X-Entity-Email'} }
  
  # Note: setting this option does modify the header_names behaviour,
  # see the header_names section above.
  #
  # Example:
  #
  #   `config.identifiers = { super_admin: 'phone_number', user: 'uuid' }`
  #
  # config.identifiers = { user: 'email' }

  # Configure the Devise trackable strategy integration.
  #
  # If true, tracking is disabled for token authentication: signing in through
  # token authentication won't modify the Devise trackable statistics.
  #
  # If false, given Devise trackable is configured for the relevant model,
  # then signing in through token authentication will be tracked as any other sign in.
  #
  # config.skip_devise_trackable = true
end