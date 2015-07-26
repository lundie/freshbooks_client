module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/gateway
    class Gateway < Freshbooks::Client
      include Freshbooks::API::NoCRUD
    end
  end
end
