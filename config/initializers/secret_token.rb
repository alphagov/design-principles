# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
DesignPrinciples::Application.config.secret_token = 'ee0d598834f5969b679cf6f0de4e31d8e5291c6f0f646f83c61bc4650f8d45723845c4c04baecb09d62c7847653bdeab7e8542a9bae306074def57c1e33e0a25'
DesignPrinciples::Application.config.secret_key_base = 'ec75048af4551edebbe85f7071380cf4447eab834af85a26471faf8a29f723ba1a8cc36dbcfef2f08bb49c43a14f201d6cbc31c983035be955a58e687d5c7c96'
