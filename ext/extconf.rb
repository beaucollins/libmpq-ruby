require 'mkmf'

if have_library('mpq')
  find_library('mpq', '/usr/local/lib')
end

if have_header('mpq.h')
  puts "no prefix"
elsif have_header('libmpq/mpq.h')
  puts "prefix libmpq"
end

create_makefile('mpq_archive')