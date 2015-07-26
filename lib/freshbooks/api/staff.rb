module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/staff
    class Staff < Freshbooks::Client
      # CRUD

      # Returns the current user's details.
      def current(params = {})
        call('staff.current', params)
      end
    end
  end
end
