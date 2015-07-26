module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/invoices#invoice.getPDF
    class Invoice < Freshbooks::Client
      # CRUD

      # Returns the specified invoice in PDF format.
      def get_pdf(params = {})
        call('invoice.getPDF', params)
      end

      # Send an existing invoice to your client via e-mail.
      def send_by_email(params = {})
        call('invoice.sendByEmail', params)
      end

      # Send an existing invoice to your client via snail mail.
      def send_by_snail_mail(params = {})
        call('invoice.sendBySnailMail', params)
      end

      # Adds a new line/lines to an existing invoice.
      def add_lines(params = {})
        call('invoice.lines.add', params)
      end
      alias_method :add_line, :add_lines

      # Deletes a line from an existing invoice.
      def delete_lines(params = {})
        call('invoice.lines.delete', params)
      end
      alias_method :delete_line, :delete_lines

      # Updates a line on an existing invoice.
      def update_lines(params = {})
        call('invoice.lines.update', params)
      end
      alias_method :update_line, :update_lines
    end
  end
end
