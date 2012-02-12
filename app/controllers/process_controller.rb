class ProcessController < ApplicationController
  def post
  require 'net/http'
  require 'net/https'
  require 'uri'

#grab the POST data and assign to instance vars - use URI.parse to split url into host and path.
  @userPost = params[:post]
  @userUrl = URI.parse(params[:url])
  @userTo = params[:timeout]

  http = Net::HTTP.new(@userUrl.host, 443)
  http.use_ssl = true
  http.read_timeout = @userTo.to_i

  #Send HTTPS Post
  resp, data = http.post(@userUrl.path, @userPost)
  @response = data
  end
end