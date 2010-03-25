# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_location_session',
  :secret      => '37c3a57059bb85a558394247a3eab3bd2cd14c876ce158afd73795bc066e0d37c236938f055612b4268d144f32ca4e6b3a7a81970c69d3e555a89c73035735fe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
