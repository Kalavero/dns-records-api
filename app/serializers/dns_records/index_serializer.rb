module DnsRecords
  class IndexSerializer
    include Pagy::Backend

    def initialize(serializable, params)
      @serializable = serializable
      @params = params
    end

    def call
      @pagy, @serializable = pagy(serializable)
      {
        total_records: @pagy.count,
        records: DnsRecords::DnsRecordSerializer.new(serializable).call,
        related_hostnames: related_hostnames(serializable)
      }
    end

    private

    attr_reader :serializable, :params

    def related_hostnames(records)
      Hostname.where(dns_record: records).map do |hostname|
        {
          count: records.joins(:hostnames).where(hostnames: {hostname: hostname.hostname}).count,
          hostname: hostname.hostname
        }
      end
    end
  end
end
