require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_valid(:query).when('Tracy Morgan', 'Michelle Obama') }
  it { should_not have_valid(:query).when('', nil) }

  it { should have_valid(:score).when(1, 5, 50) }
  it { should_not have_valid(:score).when(nil, '', 3.5) }
end
