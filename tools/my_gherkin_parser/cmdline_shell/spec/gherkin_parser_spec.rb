require 'rspec'
# require_relative '../lib/gherkin_parser'
require_relative 'spec_helper'
# require 'awesome_print'
require 'ap'

SIMPLE_FEATURE = <<-EOF
# comment
@tag
Feature: feat desc
overflow

  Background: bg desc
      Given some setup
  # comment

  @scen_tag
  Scenario Outline: scen outline desc <title>
    When this <thing>
    Then that <thang>
    Examples:
      | title  | thing | thang |
      | case 1 | 1     | one   |
      | case 2 | 2     | two   |

EOF

def simple_sample_feature_obj scen_str
  scen = scen_str.split "\n"
  feat_comment = Comment.new scen.shift
  feat_tags = Tags.new scen.shift
  feat = Feature.new scen.shift
  feat.comments = feat_comment
  feat.tags = feat_tags


  feat
end

describe GherkinParser do
  describe "init" do
    let(:test_loc) {'./spec/testdata'}

    context "with ketchup" do
      let(:gp) {GherkinParser.new(test_loc)}
      it 'should pick up all the features' do
        ans = gp.features.size
        expect(ans).to eq 39
      end
    end

    context 'sample parser above' do
      res = simple_sample_feature_obj SIMPLE_FEATURE
      p res
      puts res
      ap res
    end
  end
end