require_relative '../spec_helper'

describe RubyXLWriter do
  context 'init' do
    let(:w) {RubyXLWriter.new}
    it 'should follow this contract' do
      w.sheets
    end
    it 'should follow this contract' do
      w.write_new_row
    end
    it 'should follow this contract' do
      w.write_title
    end
  end
end