module DnsRecords
  class DnsRecordSerializer
    def initialize(serializable)
      @serializable = serializable
    end

    def call
      if serializable.respond_to?(:map)
        serializable.map { |record| hashify(record) }
      else
        hashify(serializable)
      end
    end

    private

    attr_reader :serializable

    def hashify(record)
      {
        id: record.id,
        ip_address: record.ip
      }
    end
  end
end
