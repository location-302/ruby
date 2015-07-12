require 'cgi'
require 'digest'

def location302Url(id, secret, url)
  service_url = 'http://302-location.com'

  token = Digest::SHA256.hexdigest(secret + url)
  token = token[0...4]

  redirect_url = CGI::escape(url)
  params = "i=#{id}&u=#{redirect_url}&t=#{token}"

  "#{service_url}/?#{params}"
end
