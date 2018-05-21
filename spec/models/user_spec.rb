require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  # ensure columns email and encrypted_password are present before saving
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:encrypted_password) }
end
