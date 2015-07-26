module Freshbooks
  module API
    # http://www.freshbooks.com/developers/docs/languages
    class Language < Freshbooks::Client
      include Freshbooks::API::NoCRUD
    end
  end
end
