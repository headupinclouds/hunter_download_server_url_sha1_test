cmake_minimum_required(VERSION 3.2)

include("cmake/HunterGate.cmake")
HunterGate(
  URL "https://github.com/ruslo/hunter/archive/v0.23.166.tar.gz"
  SHA1 "191e82bfb8ef86b070a99edf419af39bced04c47"
  LOCAL # cmake/Hunter/config.cmake
)

project(hunter_download_server_url_sha1_test)

hunter_add_package(half)
find_package(half CONFIG REQUIRED)

add_executable(test main.cpp)

target_link_libraries(test PUBLIC half::half)
