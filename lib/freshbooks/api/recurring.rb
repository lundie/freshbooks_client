module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/recurring
    class Recurring < Freshbooks::Client
      # CRUD

      # Add a new line/lines to an existing recurring profile.
      def add_lines(params = {})
        call('recurring.lines.add', params)
      end
      alias_method :add_line, :add_lines

      # Deletes a single line from an existing recurring profile.
      def delete_lines(params = {})
        call('recurring.lines.delete', params)
      end
      alias_method :delete_line, :delete_lines

      # Updates an existing line/lines on an existing recurring profile.
      def update_lines(params = {})
        call('recurring.lines.update', params)
      end
      alias_method :update_line, :update_lines
    end
  end
end
