if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_BPGJXnIvAdz2RuSWDNB7fK8z',
    :secret_key => 'sk_test_GqtjNX4ZoL9NGGu29hDVnjjX'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
