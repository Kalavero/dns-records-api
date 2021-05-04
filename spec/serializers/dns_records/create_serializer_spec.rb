require 'rails_helper'

RSpec.describe DnsRecords::CreateSerializer do
  describe '#to_h' do
    let(:dns_record) { DnsRecord.new(id: 1, ip: '1.1.1.1') }

    subject { described_class.new(dns_record).to_h }

    it { is_expected.to eq({id: 1, ip: '1.1.1.1'})}
  end
end
