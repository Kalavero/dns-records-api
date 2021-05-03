require 'rails_helper'

RSpec.describe DnsRecord, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:hostnames) }
  end
end
