require 'rspec'
require_relative 'renamer'

describe 'rename' do
  context 'simple methods' do
    describe 'standardized_file_name' do
      let(:r) {Renamer.new}

      def name_check res, exp
        expect(res).to eq(exp)
      end

      it 'should get the names standardized correctly' do
        inp = %w[
./DIR/Na\ Me.3
./DIR/NaMe.3
./dir/Name.one
./Dir\ /Name.one
./Dir/\ ShouldStrip\ .kod
./Dir/\ Na\ \ \ Me\ \ \ .kod
]

        exp = %w[
./DIR/na_me.3
./DIR/name.3
./dir/name.one
./Dir\ /name.one
./Dir/shouldstrip.kod
./Dir/na_me.kod
]
        (0...inp.size).each {|i| name_check r.standardized_file_name(inp[i]), exp[i]}
      end

      context 'snakecase' do

        def name_check res, exp
          expect(res).to eq(exp)
        end

        it 'should get the names standardized correctly' do
          inp = %w[
na\ me
n\ am-e
]

          exp = %w[
na_me
n_am-e
]
          (0...inp.size).each {|i| name_check r.snakecase(inp[i]), exp[i]}
        end
      end

      context 'accurate_file_name' do

        def name_check res, exp
          expect(res).to eq(exp)
        end

        it 'should get the names standardized correctly' do
          inp = %w[
na\ me
n\ am-e
]

          exp = %w[
na_me
n_am-e
]
          (0...inp.size).each {|i| name_check r.accurate_file_name(inp[i]), exp[i]}
        end
      end
    end
  end

end
