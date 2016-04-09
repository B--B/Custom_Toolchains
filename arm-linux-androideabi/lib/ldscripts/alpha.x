/* Default linker script, for normal executables */
/* Modified for Android.  */
/* Copyright (C) 2014 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("ecoff-littlealpha")
ENTRY (__start)
SECTIONS
{
  . = 0x120000000 + SIZEOF_HEADERS;
  .text : {
     _ftext = . ;
     __istart = . ;
     *(.init)
     LONG (0x6bfa8001)
     eprol  =  .;
    *(.text)
     __fstart = . ;
     *(.fini)
     LONG (0x6bfa8001)
     _etext  =  .;
  }
  .rdata : {
    *(.rdata)
  }
  .rconst : {
    *(.rconst)
  }
  .pdata : {
     _fpdata = .;
    *(.pdata)
  }
  . = 0x140000000;
  .data : {
     _fdata = .;
    *(.data)
    CONSTRUCTORS
  }
  .xdata : {
    *(.xdata)
  }
   _gp = ALIGN (16) + 0x8000;
  .lit8 : {
    *(.lit8)
  }
  .lita : {
    *(.lita)
  }
  .sdata : {
    *(.sdata)
  }
   _EDATA  =  .;
   _FBSS = .;
  .sbss : {
    *(.sbss)
    *(.scommon)
  }
  .bss : {
    *(.bss)
    *(COMMON)
  }
   _end = .;
}
