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

    context "plain id files" do
      let(:gp) {GherkinParser.new(test_loc)}
      it 'should pick up all the features' do
        ans = gp.features.size
        expect(ans).to eq 44
      end
    end

    context 'sample parser above' do
      it 'should parse out the feature like this' do
        res = simple_sample_feature_obj SIMPLE_FEATURE
        # puts res
        # ap res.to_s
        out = res.ai(plain: true, raw: true)
        str = <<-EOS.strip
#<Feature:placeholder_id
    attr_accessor :comments = #<Comment:placeholder_id
        attr_accessor :content = "# comment"
    >,
    attr_accessor :content = "Feature: feat desc",
    attr_accessor :items = [
        [0] #<Comment:placeholder_id
            attr_accessor :content = "# comment"
        >,
        [1] #<Tags:placeholder_id
            attr_accessor :content = "@tag",
            attr_accessor :items = []
        >
    ],
    attr_accessor :tags = #<Tags:placeholder_id
        attr_accessor :content = "@tag",
        attr_accessor :items = []
    >,
    attr_accessor :title = " feat desc",
    attr_reader :keyword = "Feature:"
>
        EOS
        expect(out).to be_similar_to(str)
          # expect(out).to eq(str)
          # expect(out).to match(str)
      end
    end
  end
end