require 'rails_helper'

RSpec.describe Listing, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:creator_id) }

    it { should validate_length_of(:isbn).is_at_least(10).is_at_most(13).allow_nil }

    it { should validate_presence_of(:tittle) }
      
    end
end
