module Interface
  def method(name)
    define_method(name) {|*args|
      raise NotImplementedError.new("implemented interface method: '#{name}'")
    }
  end
end

module IWriter
  extend Interface
  method :initialize
  method :write_title
  method :write_new_row
end

class AbstractWriter
  include IWriter
  include LoggerSetup

  attr_accessor :sheets, :active_sheet

  def initialize
    init_logger
    @log.debug "initing AbstractWriter"
    @sheets = {}
  end

  def make_new_sheet name = nil
    @log.debug "make new abstract sheet"
    name = "Sheet #{@sheets.size + 1}"
    @sheets[name] = Sheet.new name
    # todo: file name collision handle
  end
end

class Sheet
  attr_accessor :name, :rows, :current_row

  def initialize name
    @name = name
    @rows = []
  end

  def current_row
    @rows.size + 1
  end

  def add_row ary
    @rows << ary
  end
end