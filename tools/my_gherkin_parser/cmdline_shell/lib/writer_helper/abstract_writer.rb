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

  attr_accessor :sheets

  def initialize
    init_logger
    @log.debug "initing AbstractWriter"
    @sheets = []
  end
end

class Sheet
  attr_accessor :current_row
end