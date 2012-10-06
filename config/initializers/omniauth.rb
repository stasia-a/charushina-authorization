Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end
#if Rails.env.development?
#  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
#end