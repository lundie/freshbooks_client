module Freshbooks
  module API
    # Prevents default CRUD ability in [Freshbooks::Client].
    module NoCRUD
      def self.included(_)
        no_crud
      end

      def self.no_crud
        [:create, :get, :update, :delete].each do |method|
          define_method method do
            abort "Sorry, this endpoint only has a listing action."
          end
        end
      end
    end
  end
end
