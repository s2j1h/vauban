# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vauban_session',
  :secret      => '25e0a5a2e77336b34976edadde76173cf6e8031a0b91b0c197b083a666cd5d6b695b6249deae5a102015bab66dc08bedcf7180e9832eaa6bf09365b7ea47e2fc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
