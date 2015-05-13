require 'cgi'
require 'digest'

def location302Url(id, secret, url)
  service_url = 'http://302-location.com'
  redirect_url = CGI::escape(url)
  params = "id=#{id}&url=#{redirect_url}"
  token = Digest::SHA256.hexdigest(secret + params)
  "#{service_url}/?#{params}&token=#{token}"
end