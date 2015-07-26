module Freshbooks
  # A namespace for all classes and methods making direct calls to the
  # Freshbooks API.
  module API
    # http://www.freshbooks.com/developers/docs/callbacks
    class Callback < Freshbooks::Client
      # Verifies a callback using a unique verification code.
      #
      # @param params [Hash] a hash of params to verify a callback
      def verify(params = {})
        call('callback.verify', callback: params)
      end

      # Resends a verification code to an unverified callback.
      #
      # @param params [Hash] a hash of params to resend a callback token
      def resend_token(params = {})
        call('callback.resendToken', params)
      end
    end
  end
end

