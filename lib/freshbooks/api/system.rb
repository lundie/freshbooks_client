# -*- coding: utf-8 -*-
module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/system
    class System < Freshbooks::Client
      include Freshbooks::API::NoCRUDL

      # Returns the current system’s information (beta).
      def current(params = {})
        call('system.current', params)
      end
    end
  end
end
