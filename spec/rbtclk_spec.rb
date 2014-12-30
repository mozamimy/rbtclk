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
       color: "black",
       time: "180"}
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
      context "params contains :mode value" do
        let(:params_that_has_no_mode) do
          filled_params.delete(:mode)
          filled_params
        end

        let(:params_that_has_no_mode_and_no_time) do
          params_that_has_no_mode.delete(:time)
          params_that_has_no_mode
        end

        context "mode is clock" do
          specify ":mode and :time values are removed" do
            Rbtclk.remove_extra_params(filled_params)
            expect(filled_params).to eq params_that_has_no_mode_and_no_time
          end
        end

        context "mode is countdown" do
          let(:filled_params_whose_mode_is_clock) do
            filled_params[:mode] = "countdown"
            filled_params
          end

          specify ":mode and :time values are removed" do
            Rbtclk.remove_extra_params(filled_params)
            expect(filled_params_whose_mode_is_clock).to eq params_that_has_no_mode
          end
        end
      end
    end
  end
end
