module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/email_templates
    class EmailTemplate < Freshbooks::Client
      include NoCD
    end
  end
end
