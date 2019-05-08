require 'rspec'
require_relative '../lib/log_utils'
require_relative '../lib/gherkin_report_writer'
require_relative 'gherkin_parser_spec'
# require_relative 'gherkin_parser'
require_relative '../../models/models_ready'


FileNotRemoved = Class.new StandardError

describe GherkinReportWriter do
  include LoggerSetup

  describe "init" do
    REPORT_FILE_LOC = './../reports'
    REPORT_FILE_NAME = 'demo_file'

    let(:glob_str) {File.join(REPORT_FILE_LOC, '**', REPORT_FILE_NAME + '*')}
    let(:grw) {GherkinReportWriter.new(REPORT_FILE_LOC, REPORT_FILE_NAME)}

    before(:all) do
      init_logger
      @log.debug "before all block"
    end

    before(:each) do
      @log.debug "before all block"
    end

    after(:all) do
      @log.debug "before all block"
    end

    after(:each) do
      glob_str = File.join(REPORT_FILE_LOC, '**', REPORT_FILE_NAME + '*')
      ans = Dir.glob(glob_str)
      FileUtils.rm ans
      ans = Dir.glob(glob_str)
      raise FileNotRemoved.new("please see why the file #{ans} is not removed yet") if ans.any?
      @log.debug "after each"
    end

    context "file create check" do
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
        grw
        ans = Dir.glob(glob_str)
        grw.add_feature_row gpo.features[0]
        expect(ans.size).to eq 1
      end
    end
  end

  describe "write out" do
    context "with a sample feature model" do
      
    end
  end
  
end
