module Freshbooks
  module API
    # Prevents default create and delete ability in [Freshbooks::Client].
    module NoCD
      def self.included(_)
        [:create, :delete].each do |method|
          define_method method do
            abort "Sorry, this endpoint has no CRUD or listing actions."

          end
        end
      end
    end
  end
end
