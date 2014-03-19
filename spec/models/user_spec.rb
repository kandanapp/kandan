require 'spec_helper'
require 'cancan/matchers'

describe User do
  describe "associations" do
    it { should have_many(:activities) }
  end

  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) { nil }
    let(:channel) { FactoryGirl.build(:channel) }

    shared_examples_for 'standard channel authorization' do
      let(:primary_channel) { FactoryGirl.build(:primary_channel) }

      it 'should not be able to destroy the primary channel' do
        should_not be_able_to(:destroy, primary_channel)
      end

      it 'should be able to create a channel' do
        should be_able_to(:create, channel)
      end

      it 'should be able to read channels' do
        should be_able_to(:read, primary_channel)
        should be_able_to(:read, channel)
      end
    end

    context "an admin" do
      let(:user) { FactoryGirl.build(:admin) }

      it 'should be able to destroy a channel' do
        should be_able_to(:destroy, channel)
      end

      it 'should be able to update a channel' do
        should be_able_to(:update, channel)
      end

      it_behaves_like 'standard channel authorization'
    end

    context "a user" do
      let(:user) { FactoryGirl.build(:user) }

      it 'should not be able to destroy a channel' do
        should_not be_able_to(:destroy, channel)
      end

      it 'should not be able to update a channel' do
        should_not be_able_to(:update, channel)
      end

      it_behaves_like 'standard channel authorization'
    end
  end

  it "should have authentication token on creation" do
    subject { @user.authentication_token }
    expect(subject).to_not eq(nil)
  end

  it "should have gravatar hash on creation" do
    subject { @user.gravatar_hash }
    expect(subject).to_not eq(nil)
  end

  describe "external avatar" do
    it "should have no avatar url on creation" do
      subject { User.new() }
      expect(subject.avatar_url).to be_nil
    end

    context "check url" do
      subject { FactoryGirl.build(:user) }

      it "should accept small image url with allowed extension" do
        subject.avatar_url = "https://github.global.ssl.fastly.net/images/icons/emoji/+1.png"
        expect(subject.save).to be_true
        expect(subject).to be_valid
      end

      it "should not accept url with extension that is not allowed in config" do
        # a 35KB midi sound
        subject.avatar_url = "http://saya.pianomidi.org/musica/lfals/a-asturias.mid"
        expect(subject.save).to be_false
        expect(subject).to_not be_valid
        expect(subject.errors).to have_key(:avatar_url)
      end

      it "should not validate nonexistent url as avatar" do
        subject.avatar_url = "unknownProtocol://some-url-that-does-not/realy/exist.png"
        expect(subject.save).to be_false
        expect(subject).to_not be_valid
        expect(subject.errors).to have_key(:avatar_url)
      end

      it "should not validate big images as avatar" do
        # a really big Hubble image of a pair of interacting galaxies
        subject.avatar_url = "http://www.spacetelescope.org/static/archives/images/publicationjpg/heic1107a.jpg"
        expect(subject.save).to be_false
        expect(subject).to_not be_valid
        expect(subject.errors).to have_key(:avatar_url)
      end
    end
  end
end
