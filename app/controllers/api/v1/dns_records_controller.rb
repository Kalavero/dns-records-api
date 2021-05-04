module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index
        render json: DnsRecords::IndexSerializer.new(DnsRecord, params.permit!).call
      end

      # POST /dns_records
      def create
        dns_record = DnsRecord.new(create_params)

        if dns_record.save
          render json: DnsRecords::DnsRecordSerializer.new(dns_record).call,
            status: :created
        else
          render json: {error: dns_record.errors.full_messages},
            status: :unprocessable_entity
        end
      end

      private

      def create_params
        params.require(:dns_records).permit(:ip, hostnames_attributes: [:hostname])
      end
    end
  end
end
