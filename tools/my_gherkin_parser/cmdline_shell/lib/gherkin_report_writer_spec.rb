require 'rspec'
require_relative 'gherkin_report_writer'

describe GherkinReportWriter do
  describe "init" do
    let(:report_file_loc) {'../../reports'}
    let(:report_file_name) {'demo_file'}

    context "file create check" do
      let(:grw) {GherkinReportWriter.new(report_file_loc, report_file_name)}

      # specify { subject.has_ketchup_on_it?.should be_true
      it 'should output a demo_report file' do
        grw
        glob_str = File.join(report_file_loc, '**', report_file_name+'*')
        puts glob_str
        ans = Dir.glob(glob_str)
        p ans
        expect(ans.size).to eq 1
        # FileUtils.rm ans
        # ans = Dir.glob(glob_str)
        # p ans
      end
    end
  end
end