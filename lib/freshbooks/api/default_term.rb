module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/default_terms
    class DefaultTerm < Freshbooks::Client
      include NoCD

      # List/Get/Update
      def list(params = {})
        call('default_terms.list', params)
      end

      def get(params = {})
        call('default_terms.get', params)
      end

      def update(params = {})
        call('default_terms.update', params)
      end
    end
  end
end
