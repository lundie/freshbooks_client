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
        post(
          method: 'callback.create',
          callback: {
            event: params.fetch(:event),
            uri: params.fetch(:uri)
          }
        )
      end

      # Verifies a callback using a unique verification code.
      #
      # @param params [Hash] a hash of params to verify a callback
      def verify(params = {})
        post(
          method: 'callback.verify',
          callback: {
            callback_id: params.fetch(:callback_id),
            verifier: params.fetch(:verifier)
          }
        )
      end
    end
  end
end

