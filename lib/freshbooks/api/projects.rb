module Freshbooks
  module API
    class Projects < Freshbooks::Client
      def list
        post(method: 'project.list')
      end
    end
  end
end
