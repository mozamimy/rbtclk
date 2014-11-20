require 'spec_helper'

RSpec.describe Rbtclk do
  describe "#run" do
    context "clock/countdown/countup modes" do
      pending "this is pending bcause on the issue#3 (https://github.com/mozamimy/rbtclk/issues/3)"
    end

    context "-v is given as an option" do
      subject { -> { Rbtclk.run(["-v"]) } }
      it { expect(subject).to be_output "#{Rbtclk::VERSION}\n" }
    end

    context "--version is given as an option" do
      subject { -> { Rbtclk.run(["--version"]) } }
      it { expect(subject).to be_output "#{Rbtclk::VERSION}\n" }
    end
  end

  describe "#display_clock" do
    pending "this is pending bcause on the issue#3 (https://github.com/mozamimy/rbtclk/issues/3)"
  end


  describe "methods related with params" do
    let(:filled_params) do
      {mode: "clock",
       font: "clb8x8",
       format: "%X",
       color: "black"}
    end

    describe "#fill" do
      context "there are no blank elements in the argument" do
        subject { Rbtclk.fill(filled_params) }
        it { expect(subject).to eq filled_params }
      end

      context "there in a blank element in the argument" do
        let(:not_filled_params) do
          {mode: "clock",
           font: "clb8x8",
           format: "%X"}
        end

        subject { Rbtclk.fill(not_filled_params) }
        it { expect(subject).to eq filled_params }
      end
    end

    describe "#remove_extra_params" do
      let(:params_that_has_no_mode) do
        filled_params.delete(:mode)
        filled_params
      end

      context "params contains :mode value" do
        specify ":mode value is removed" do
          Rbtclk.remove_extra_params(filled_params)
          expect(filled_params).to eq params_that_has_no_mode
        end
      end
    end
  end
end
