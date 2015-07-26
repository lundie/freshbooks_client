module Freshbooks
  module API
    module CRUD
      # Creates something based on params.
      #
      # @example Create a new project.
      #   @clients.projects.create(name: "Some Project", bill_method: "project-rate")
      #   # => { "project_id" => "1234" }
      #
      # @param params [Hash] A hash of params to create something.
      def create(params = {})
        call("#{@endpoint}.create", { @endpoint => params })
      end

      # Updates something based on params.
      #
      # @example Update an existing project.
      #   @client.projects.update(project_id: 1234, bill_method: "credit-card")
      #   # => { "project_id" => "1234" }
      #
      # @param params [Hash] A hash of params to update something.
      def update(params = {})
        call("#{@endpoint}.update", { @endpoint => params })
      end

      # Get something's details based on the `<something>_id`.
      #
      # @example Get a project by `project_id`.
      #   @client.projects.get(project_id: 1234)
      #   # => {"projects" => [...]}
      #
      # @param params [Hash] A hash of params to get something's details.
      def get(params = {})
        call("#{@endpoint}.get", params)
      end

      # Delete something based on its `<something>_id`.
      #
      # @example Delete a project.
      #   @client.projects.delete(project_id: 1234)
      #   # => 200 OK
      #
      # @param params [Hash] A hash of params to delete something.
      def delete(params = {})
        call("#{@endpoint}.delete", params)
      end

      # List a bunch of somethings.
      #
      # @example List all projects.
      #   @client.projects.list
      #   # => {"projects" => [...]}
      #
      # @param params [Hash] A hash of params ot filter the listing.
      def list(params = {})
        call("#{@endpoint}.list", params)
      end
    end
  end
end
