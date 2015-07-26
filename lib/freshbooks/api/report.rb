module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/reports
    class Report < Freshbooks::Client
      include Freshbooks::API::NoCRUDL

      # Returns profit and account standing details for the specified client.
      def get_client_details(params = {})
        call('report.getClientDetails', params)
      end

      # Returns total estimated, accepted and invoiced values for invoices; broken down by currency.
      def get_estimate_details(params = {})
        call('report.getEstimateDetails', params)
      end

      # Returns information about all, or a filtered set of expenses.
      def get_expense_details(params = {})
        call('report.getExpenseDetails', params)
      end

      # Returns information about all, or a filtered set of invoices.
      def get_invoice_details(params = {})
        call('report.getInvoiceDetails', params)
      end

      # Reports profit and loss details.
      def get_profit_details(params = {})
        call('report.getProfitDetails', params)
      end
    end
  end
end
