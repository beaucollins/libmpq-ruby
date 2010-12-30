#include <stdio.h>
#include <libmpq/mpq.h>
#include "ruby.h"

static VALUE rb_mMPQ;
static VALUE rb_cMPQArchive;


static VALUE rb_mpq_archive_read_file(VALUE self, VALUE name){
  
  // archive struct
  mpq_archive_s *archive;
  // stores the index number for "(listfile)"
  unsigned int file_index;
  // stores the contents of the "(listfile)"
  char *contents;
  // stores the file size for string malloc
  off_t file_size;
  // retrieve the file path from the class
  VALUE file_path = rb_funcall(self, rb_intern("path"), 0);
  // make sure we have a string
  Check_Type(file_path, T_STRING);
  Check_Type(name, T_STRING);
  
  VALUE buf = rb_str_buf_new(1024);
  
  // start your engines
  libmpq__init();
  int return_code;
  if(return_code = libmpq__archive_open(&archive, RSTRING_PTR(file_path), -1) != 0)
  {
    // raise an error? or just return the non-zero int?
    return INT2FIX(return_code) ;
  }
  
  // get filenumber and size for listfile
  if (return_code = libmpq__file_number(archive, RSTRING_PTR(name), &file_index) != 0) {
    printf("No %s in '%s'.\n", RSTRING_PTR(name), RSTRING_PTR(file_path));
    libmpq__archive_close(archive);
    return INT2FIX(return_code);
  }
  
  // we've succesffully opene the archive
  libmpq__file_unpacked_size(archive, file_index, &file_size);
  
  // read listfile content into memory
  contents = malloc(file_size);
  
  libmpq__file_read(archive, file_index, contents, file_size, NULL);
  
  rb_str_cat(buf, contents, file_size);
  
  free(contents);
  
  // free up your shit
  libmpq__shutdown();
  
  return buf;
  
}


void Init_mpq_archive(){
  
  rb_mMPQ = rb_define_module("MPQ");
  rb_cMPQArchive = rb_define_class_under(rb_mMPQ, "Archive", rb_cObject);
  
  rb_define_method(rb_cMPQArchive, "read_file", rb_mpq_archive_read_file, 1);
  
}