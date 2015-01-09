require "spec_helper"

RSpec.describe Rbtclk::ConfigLoader do
  let(:target_klass) do
    class Dummy
      constants.each do |c|
        remove_const c
      end
    end

    Dummy.extend Rbtclk::ConfigLoader
  end

  describe ".configure" do
    before do
      target_klass.configure do |c|
        c.mode = "Alice"
        c.font = "white-rabbit"
        c.format = "cheshire-cat"
        c.color = "queen-of-hearts"
        c.time = "march-hare"
        c.no_alarm = true
      end
    end

    it { expect(target_klass::MODE).to eq "Alice" }
    it { expect(target_klass::FONT).to eq "white-rabbit"  }
    it { expect(target_klass::FORMAT).to eq "cheshire-cat" }
    it { expect(target_klass::COLOR).to eq "queen-of-hearts" }
    it { expect(target_klass::TIME).to eq "march-hare" }
    it { expect(target_klass::NO_ALARM).to eq true }
  end

  describe ".mode" do
    before { target_klass.mode = "Alice" }
    it { expect(target_klass::MODE).to eq "Alice" }
  end

  describe ".font" do
    before { target_klass.font = "white-rabbit" }
    it { expect(target_klass::FONT).to eq "white-rabbit" }
  end

  describe ".format" do
    before { target_klass.format = "cheshire-cat" }
    it { expect(target_klass::FORMAT).to eq "cheshire-cat" }
  end

  describe ".color" do
    before { target_klass.color = "queen-of-hearts" }
    it { expect(target_klass::COLOR).to eq "queen-of-hearts" }
  end

  describe ".time" do
    before { target_klass.time = "march-hare" }
    it { expect(target_klass::TIME).to eq "march-hare" }
  end

  describe ".no_alarm" do
    before { target_klass.no_alarm = true }
    it { expect(target_klass::NO_ALARM).to eq true }
  end
end
