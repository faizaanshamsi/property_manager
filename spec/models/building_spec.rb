require 'spec_helper'

describe Building do

  describe 'Database Tests' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:street_address).of_type(:string) }
    it { should have_db_column(:city).of_type(:string) }
    it { should have_db_column(:state).of_type(:string) }
    it { should have_db_column(:postal_code).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
  end

  describe 'Validation Tests' do
    STATE = %w{ AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY }

    it { should have_valid(:name).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:name).when('', nil) }

    it { should have_valid(:street_address).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:street_address).when('', nil) }

    it { should have_valid(:city).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:city).when('', nil) }

    it { should have_valid(:postal_code).when('02125', 'N2L 1W7') }
    it { should_not have_valid(:postal_code).when('', nil) }

    it { should ensure_inclusion_of(:state).in_array(STATE) }
  end
end
