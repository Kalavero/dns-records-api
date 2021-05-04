module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index
        # TODO: Implement this action
      end

      # POST /dns_records
      def create
        dns_record = DnsRecord.new(create_params)

        if dns_record.save
          render json: DnsRecords::CreateSerializer.new(dns_record).to_h,
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
