require 'rails_helper'

RSpec.describe User, type: :model do

  let(:subject) { create(:user) }

  #it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email)}
end

RSpec.describe Twit, type: :model do

  let(:subject) { create(:twit) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_length_of(:message) }
  it { is_expected.to have_many(:twit_tags) }
  it { is_expected.to have_many(:tags) }
end

RSpec.describe Tag, type: :model do

  let(:subject) { create(:tag) }
  
  it { is_expected.to have_many(:twit_tags) }
  it { is_expected.to have_many(:twits) }
end
