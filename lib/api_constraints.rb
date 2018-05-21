class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  # This is a method of constraints as used in routes.rb and requires a 'true' result
  # to follow the route. If false, it moves on through the routes until true
  # True will result from either default being specified in routes or if the request header,
  # Accept, contains the string in this method.
  # the client.
  # Params:
  # +req+:: request object sent by the client
  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.illuminate.v#{@version}")
  end
end