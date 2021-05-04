module DnsRecords
  class CreateSerializer
    def initialize(serializable)
      @serializable = serializable
    end

    def to_h
      {
        id: serializable.id,
        ip: serializable.ip
      }
    end

    private

    attr_reader :serializable
  end
end
