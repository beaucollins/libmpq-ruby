## libmpq-ruby

A very basic wrapper to the [libmpq](https://libmpq.org/) library. It allows you to read, decrypt and unpack MPQ files.

### Usage

    require 'mpq'
    
    archive = MPQ("path/to/file.mpq")
    
    # list the files in the archive
    archive.manifest
    