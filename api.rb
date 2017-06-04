require 'rest-client'

class A_api

  MOCK_DEFAULT_HOST = ''

  API_DEFAULT_METHOD = 'get'

  AUTH_DEFAULT_VALUES = {}

  attr_accessor :path, :params, :method, :params, :host

  def initialize(path= '', method= nil, params= {}, host= nil)
    @host = host || MOCK_DEFAULT_HOST
    @path = path
    @method = method || API_DEFAULT_METHOD
    @params = params
  end

  def pull_respond(auth = nil, header = {})
    auth ||= AUTH_DEFAULT_VALUES
    a_type = @method.to_sym

    case a_type
      when :get
        get_digest(auth)
      when :post
        post_digest(auth)
    end

  end

  private

  def get_digest(auth)

  end

  def post_digest(auth)

  end

end