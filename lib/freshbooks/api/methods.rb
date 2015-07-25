module Freshbooks::API
  # Defines methods for accessing API endpoints from the main [Freshbooks::Client] class.
  module Methods
    # @return [Freshbooks::API::Callback]
    def callbacks
      Freshbooks::API::Callback.new(options)
    end

    # @return [Freshbooks::API::Category]
    def categories
      Freshbooks::API::Category.new(options)
    end

    # @return [Freshbooks::API::Client]
    def clients
      Freshbooks::API::Client.new(options)
    end

    # @return [Freshbooks::API::Estimate]
    def estimates
      Freshbooks::API::Estimate.new(options)
    end

    # @return [Freshbooks::API::Expense]
    def expenses
      Freshbooks::API::Expense.new(options)
    end

    # @return [Freshbooks::API::Gateway]
    def gateways
      Freshbooks::API::Gateway.new(options)
    end

    # @return [Freshbooks::API::Invoice]
    def invoices
      Freshbooks::API::Invoice.new(options)
    end

    # @return [Freshbooks::API::Item]
    def items
      Freshbooks::API::Item.new(options)
    end

    # @return [Freshbooks::API::Language]
    def languages
      Freshbooks::API::Language.new(options)
    end

    # @return [Freshbooks::API::Payment]
    def payments
      Freshbooks::API::Payment.new(options)
    end

    # @return [Freshbooks::API::Project]
    def projects
      Freshbooks::API::Project.new(options)
    end

    # @return [Freshbooks::API::Receipt]
    def receipts
      Freshbooks::API::Receipt.new(options)
    end

    # @return [Freshbooks::API::Recurring]
    def recurring
      Freshbooks::API::Recurring.new(options)
    end

    # @return [Freshbooks::API::Staff]
    def staff
      Freshbooks::API::Staff.new(options)
    end

    # @return [Freshbooks::API::System]
    def systems
      Freshbooks::API::System.new(options)
    end

    # @return [Freshbooks::API::Task]
    def tasks
      Freshbooks::API::Task.new(options)
    end

    # @return [Freshbooks::API::Tax]
    def taxes
      Freshbooks::API::Tax.new(options)
    end

    # @return [Freshbooks::API::TimeEntry]
    def time_entries
      Freshbooks::API::TimeEntry.new(options)
    end

    # @return [Freshbooks::API::Contractor]
    def contractors
      Freshbooks::API::Contractor.new(options)
    end

    # @return [Freshbooks::API::DefaultTerm]
    def default_terms
      Freshbooks::API::DefaultTerm.new(options)
    end

    # @return [Freshbooks::API::Report]
    def reports
      Freshbooks::API::Report.new(options)
    end

    # @return [Freshbooks::API::Currency]
    def currencies
      Freshbooks::API::Currency.new(options)
    end

    # @return [Freshbooks::API::EmailTemplate]
    def email_templates
      Freshbooks::API::EmailTemplate.new(options)
    end
  end
end
