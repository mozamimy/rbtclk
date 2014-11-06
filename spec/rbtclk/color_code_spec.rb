require "spec_helper"
require "curses"

RSpec.describe Rbtclk::ColorCode do
  include Rbtclk::ColorCode

  describe "#translate" do
    context "the argument is string" do
      subject { translate("magenta") }
      it { expect(subject).to eq Curses::COLOR_MAGENTA }
    end

    context "the argument is symbol" do
      subject { translate(:magenta) }
      it { expect(subject).to eq Curses::COLOR_MAGENTA }
    end
  end
end
