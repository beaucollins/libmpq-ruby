## libmpq-ruby

A very basic wrapper to the [libmpq](https://libmpq.org/) library. It allows you to read, decrypt and unpack MPQ files.

### Usage

    require 'mpq'
    
    archive = MPQ("test/fixtures/replay.SC2replay")
    # => #<MPQ::Archive:0x1003732b8 @path="test/fixtures/replay.SC2replay"> 
    
    # list the files in the archive
    archive.manifest
    # => ["replay.attributes.events", "replay.details", ... truncated for legibility
    
    archive.read_file('replay.message.events')
    # => "\000\"\200\000\000\034\000\000 ... truncated for legibility