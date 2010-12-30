
require 'mpq_archive' 


class MPQ::Archive
  
  attr_reader :path
  
  LISTFILE  = "(listfile)"
  
  def initialize(path)
    @path = path
  end
  
  def listfile
    read_file LISTFILE
  end
  
  def manifest
    listfile.split("\n").collect(&:strip)
  end
  
end

def MPQ(file)
  MPQ::Archive.new(file)
end