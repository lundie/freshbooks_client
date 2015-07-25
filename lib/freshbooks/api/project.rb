module Freshbooks
  module API
    class Project < Freshbooks::Client
      def list(params = {})
        params[:method] = 'project.list'
        post(params).projects.project
      end
    end
  end
end
