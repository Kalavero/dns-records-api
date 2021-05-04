require 'rails_helper'

RSpec.describe DnsRecords::DnsRecordSerializer do
  describe '#call' do
    let(:dns_record) { DnsRecord.new(id: 1, ip: '1.1.1.1') }

    subject { described_class.new(dns_record).call }

    it { is_expected.to eq({id: 1, ip_address: '1.1.1.1'})}
  end
end
