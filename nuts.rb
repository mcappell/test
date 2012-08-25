Camping.goes :Nuts
module Nuts::Controllers
  class Index < R '/'
    def get
      Time.now.to_s
    end
  end
end