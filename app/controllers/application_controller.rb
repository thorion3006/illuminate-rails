class ApplicationController < ActionController::API
    
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  before_action :doorkeeper_authorize!

  respond_to :json

  # The cors_preflight_check filter will “preflight” the request by sending an OPTIONS request 
  # to the server first. This essentially asks the server if it would allow a type of client 
  # request before the request is actually sent. The server will respond with only the necessary 
  # headers and an empty text/plain. If the request is authorised then the client can then send 
  # the actual request and the server can respond.
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render text: '', content_type: 'text/plain'
    end
  end

  # The cors_set_access_control_headers filter occurs after the content has been generated but before
  # it is sent to the client so the CORS access control headers can be sent with the response for this 
  # controller.
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  private

  # The current_resource_owner method will retrieve the access token owner from the OAuth authenticated 
  # model once Doorkeeper has issued a token and you’ve included it in a request.
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end
