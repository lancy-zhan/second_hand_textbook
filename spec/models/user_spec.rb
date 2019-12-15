require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:username).case_insensitive }

    it { should validate_presence_of(:username) }

    it { should validate_length_of(:username).is_at_least(4).is_at_most(20) }
      
    end
end
