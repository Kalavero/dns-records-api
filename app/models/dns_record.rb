require 'resolv'

class DnsRecord < ApplicationRecord
  has_many :hostnames

  validates :ip, presence: true, format: { with: Resolv::AddressRegex }

  accepts_nested_attributes_for :hostnames
end
