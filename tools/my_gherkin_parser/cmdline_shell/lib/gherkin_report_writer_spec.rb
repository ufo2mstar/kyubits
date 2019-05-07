require 'rspec'
require_relative 'gherkin_report_writer'

describe GherkinReportWriter do
  describe "init" do
    # subject { gp }
    # before  { burger.apply_ketchup }
    let(:report_file_name) {'../../reports'}

    context "with ketchup" do
      let(:grw) {GherkinReportWriter.new(report_file_name)}

      # specify { subject.has_ketchup_on_it?.should be_true
      it 'should output a demo_report file' do
        grw.features.size
        ans = Dir.glob(report_file_name)
        expect(ans.size).to eq 1
        File.
      end
    end
  end
end