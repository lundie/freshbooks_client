module Freshbooks
  class Callbacks < Base
    def create
      super(properties: [
        :event,
        :uri
      ])
    end
  end
end
