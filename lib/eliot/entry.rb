module Eliot
  class Entry
    def initialize(data)
      @data = data
    end

    def to_hash
      @data.to_hash
    end
  end
end
