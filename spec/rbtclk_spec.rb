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
       time: "180",
       no_alarm: false}
    end

    before do
      filled_params.each do |attribute, value|
        const_name = attribute.to_s.upcase
        Rbtclk.send(:remove_const, const_name)
        Rbtclk.const_set(const_name, value)
      end
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
          dup_params = filled_params.dup
          dup_params.delete(:mode)
          dup_params
        end

        let(:params_that_has_no_mode_and_no_time_and_no_alarm) do
          dup_params = params_that_has_no_mode.dup
          dup_params.delete(:time)
          dup_params.delete(:no_alarm)
          dup_params
        end

        context "mode is clock" do
          specify ":mode and :time values are removed" do
            Rbtclk.remove_extra_params(filled_params)
            expect(filled_params).to eql params_that_has_no_mode_and_no_time_and_no_alarm
          end
        end

        context "mode is countdown" do
          let(:filled_params_whose_mode_is_clock) do
            dup_params = filled_params.dup
            dup_params[:mode] = "countdown"
            dup_params
          end

          specify ":mode and :time values are removed" do
            Rbtclk.remove_extra_params(filled_params_whose_mode_is_clock)
            expect(filled_params_whose_mode_is_clock).to eql params_that_has_no_mode
          end
        end
      end
    end
  end
end
