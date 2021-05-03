require 'rails_helper'

RSpec.describe Hostname, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :dns_record }
  end
end
