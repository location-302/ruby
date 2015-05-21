require 'cgi'
require 'digest'

def location302Url(id, secret, url)
  service_url = 'http://302-location.com'

  redirect_url = CGI::escape(url)
  params = "i=#{id}&u=#{redirect_url}"
  token = Digest::SHA256.hexdigest(secret + params)
  token = token[0...4]

  "#{service_url}/?#{params}&t=#{token}"
end