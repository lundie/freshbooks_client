module Freshbooks
  module API
    class Gateway < Freshbooks::Client
      # only listing

      def no_crud
        abort "Sorry, this endpoint only has a listing action."
      end

      alias_method :create, :no_crud
      alias_method :get, :no_crud
      alias_method :update, :no_crud
      alias_method :delete, :no_crud
    end
  end
end
