module Freshbooks::API
  # Defines methods for accessing API endpoints from the main [Freshbooks::Client] class.
  module Methods
    # @return [Freshbooks::API::Callback]
    def callbacks
      Freshbooks::API::Callback.new(options)
    end

    # MOAR!

    # @return [Freshbooks::API::Project]
    def projects
      Freshbooks::API::Project.new(options)
    end
  end
end
