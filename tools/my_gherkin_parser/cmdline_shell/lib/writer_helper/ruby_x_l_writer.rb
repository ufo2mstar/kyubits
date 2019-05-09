require_relative 'abstract_writer'

class RubyXLWriter < AbstractWriter
  def initialize
    super
    @log.debug "initing #{self.class}"
  end

  def write_title
    @log.debug "write title"
  end

  def write_new_row
    @log.debug "write row"
  end
end