module Freshbooks
  # A namespace for all classes and methods making direct calls to the
  # Freshbooks API.
  module API
    # http://www.freshbooks.com/developers/docs/callbacks
    class Callback < Freshbooks::Client
      # Creates a new callback for a specific event or set of events.
      #
      # @param params [Hash] a hash of params to create a callback
      def create(params = {})
        call('callback.create', [:event, :uri], params)
      end

      # Verifies a callback using a unique verification code.
      #
      # @param params [Hash] a hash of params to verify a callback
      def verify(params = {})
        call('callback.verify', [:callback_id, :verifier], params)
      end
    end
  end
end

