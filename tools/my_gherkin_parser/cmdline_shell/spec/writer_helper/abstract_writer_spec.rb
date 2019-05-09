require_relative '../spec_helper'

describe AbstractWriter do
  context 'init' do
    it 'should follow this contract' do
      w = AbstractWriter.new
      w.write_new_row
    end

  end
end