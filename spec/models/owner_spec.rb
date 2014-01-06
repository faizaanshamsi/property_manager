require 'spec_helper'

describe Owner do

  describe 'Database Tests' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:company).of_type(:string) }
  end

  describe 'Validation Tests' do
    it { should have_valid(:first_name).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:first_name).when('', nil) }

    it { should have_valid(:last_name).when('faizaan', 'mo', 'mo zhu') }
    it { should_not have_valid(:last_name).when('', nil) }

    it { should have_valid(:email).when('faizaan@shamsi.com') }
    it { should_not have_valid(:email).when('', nil, 'faizaan', 'faizaan.com', 'faizaan@comn') }
  end

  describe 'Association Tests' do
    it { should have_many(:buildings).dependent(:nullify) }
  end
end
