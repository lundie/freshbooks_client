module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/receipts
    class Receipt < Freshbooks::Client
      # CRUD (no index)

      def list(params = {})
        abort "Sorry, this endpoint doesn't have a listing action."
      end
    end
  end
end
