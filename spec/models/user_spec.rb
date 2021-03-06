require 'spec_helper'

describe User do
  it { should have_many :albums }
  it { should have_many :photos }
  it { should validate_uniqueness_of :username }
end
