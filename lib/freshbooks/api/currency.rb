module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/currency
    class Currency < Freshbooks::Client
      include Freshbooks::API::NoCRUD
    end
  end
end
