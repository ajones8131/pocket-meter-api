# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:username).of_type(:string) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
  end

end
