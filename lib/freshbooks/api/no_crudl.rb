module Freshbooks
  module API
    # Prevents default CRUD and listing ability in [Freshbooks::Client].
    module NoCRUDL
      def self.included(_)
        include NoCRUD

        define_method :list do
          abort "Sorry, this endpoint has no CRUD or listing actions."

        end
      end
    end
  end
end
