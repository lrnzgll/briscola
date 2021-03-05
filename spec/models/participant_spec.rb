require 'rails_helper'

RSpec.describe Participant, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:match) }
  it { should have_many(:deal_orders) }
end
