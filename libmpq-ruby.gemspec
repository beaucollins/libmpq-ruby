# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libmpq-ruby}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Beau Collins"]
  s.date = %q{2010-12-30}
  s.description = %q{ Uses libmpq to provie access to read, decrypting and unpacking
      MPQ files in Ruby }
  s.email = %q{beaucollins@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "Rakefile",
     "VERSION",
     "ext/.gitignore",
     "ext/extconf.rb",
     "ext/mpq_archive.c",
     "lib/mpq.rb",
     "test/fixtures/replay.SC2Replay"
  ]
  s.homepage = %q{http://github.com/beaucollins/libmpq-ruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Library for reading MPQ files using libmpq}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

