require 'rake/clean'
require 'digest/md5'

DLEXT = Config::MAKEFILE_CONFIG['DLEXT']
RUBYDIGEST = Digest::MD5.hexdigest(`#{RUBY} --version`)

file "ext/ruby-#{RUBYDIGEST}" do |f|
  rm_f FileList["ext/ruby-*"]
  touch f.name
end

CLEAN.include "ext/ruby-*"

file 'ext/Makefile' => FileList['ext/*.{c,h,rb}', "ext/ruby-#{RUBYDIGEST}"] do
  chdir('ext') { ruby 'extconf.rb' }
end
CLEAN.include 'ext/Makefile', 'ext/mkmf.log'

file "ext/mpq_archive.#{DLEXT}" => FileList["ext/Makefile"] do |f|
  sh 'cd ext && make clean && make && rm -rf conftest.dSYM'
end
CLEAN.include 'ext/*.{o,bundle,so,dll}'

file "lib/mpq_archive.#{DLEXT}" => "ext/mpq_archive.#{DLEXT}" do |f|
  cp f.prerequisites, "lib/", :preserve => true
end

namespace :ext do
  desc 'Build the mpq extension'
  task :build => "lib/mpq_archive.#{DLEXT}"
end

# PACKAGING ============

require 'rubygems'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "libmpq-ruby"
    gem.summary = %Q{ Library for reading MPQ files using libmpq }
    gem.description = %Q{ Uses libmpq to provie access to read, decrypting and unpacking
      MPQ files in Ruby }
    gem.email = "beaucollins@gmail.com"
    gem.homepage = "http://github.com/beaucollins/libmpq-ruby"
    gem.authors = ["Beau Collins"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
