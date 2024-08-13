# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Espressif/frameworks/esp-idf-v5.3/components/bootloader/subproject"
  "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader"
  "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix"
  "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix/tmp"
  "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix/src/bootloader-stamp"
  "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix/src"
  "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/rithy/Documents/MEGA/CHIPTREE/intern/sen0564_demo/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
