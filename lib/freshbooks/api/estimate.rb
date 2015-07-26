module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/estimates
    class Estimate < Freshbooks::Client
      # Send an estimate to the associated client via e-mail.
      #
      # @param params [Hash] A hash of params to send an estimate via email.
      def send_by_email(params = {})
        call('estimate.sendByEmail', params)
      end

      # Returns the specified estimate in PDF format.
      #
      # @param params [Hash] A hash of params to get an estimate's PDF.
      def get_pdf(params = {})
        call('estimate.getPDF', params)
      end

      # Change an existing estimate's status to "Accepted".
      #
      # @param params [Hash] A hash of params to accept an estimate.
      def accept(params = {})
        call('estimate.accept', params)
      end

      # Move a draft estimate into "Sent" status without issuing the estimate.
      #
      # @param params [Hash] A hash of params to mark a draft estimate as sent.
      def mark_as_sent(params = {})
        call('markAsSent', params)
      end
    end
  end
end
