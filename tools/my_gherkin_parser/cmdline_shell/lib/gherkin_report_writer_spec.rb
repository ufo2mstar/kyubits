require 'rspec'
require_relative 'gherkin_report_writer'
require_relative 'gherkin_parser_spec'
# require_relative 'gherkin_parser'
require_relative '../../models/models_ready'

describe GherkinReportWriter do
  describe "init" do
    REPORT_FILE_LOC = '../../reports'
    REPORT_FILE_NAME = 'demo_file'

    let(:glob_str) {File.join(REPORT_FILE_LOC, '**', REPORT_FILE_NAME + '*')}
    let(:grw) {GherkinReportWriter.new(REPORT_FILE_LOC, REPORT_FILE_NAME)}

    before(:all) do
      p "before all block"
    end

    after(:all) do
      glob_str = File.join(REPORT_FILE_LOC, '**', REPORT_FILE_NAME + '*')
      ans = Dir.glob(glob_str)
      FileUtils.rm ans
      ans = Dir.glob(glob_str)
      raise FileNotRemoved.new("please see why the file #{ans} is not removed yet") if ans.any?
      puts "after all ran"
    end

    context "file create check" do

      # specify { subject.has_ketchup_on_it?.should be_true
      it 'should output a demo_report file' do
        grw
        ans = Dir.glob(glob_str)
        expect(ans.size).to eq 1

      end
    end

    context "file populate check" do
      let(:gpo) {
        # gherkin parsed objs
        gpo = GherkinParser.new
        gpo.features = [Feature.new]
        gpo
      }

      it 'should output a demo_report file' do
        ans = Dir.glob(glob_str)

        grw.add_feature_row gpo.features[0]

        expect(ans.size).to eq 1
      end
    end
  end
end

FileNotRemoved = Class.new StandardError