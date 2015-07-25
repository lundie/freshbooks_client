module Freshbooks
  module API
    class Project < Freshbooks::Client
      def list(params = {})
        call('project.list', [:method], params)
      end
    end
  end
end
