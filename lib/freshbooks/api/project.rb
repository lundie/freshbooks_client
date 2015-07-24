module Freshbooks
  module API
    class Project < Freshbooks::Client
      def list
        post({method: 'project.list'})
      end
    end
  end
end
