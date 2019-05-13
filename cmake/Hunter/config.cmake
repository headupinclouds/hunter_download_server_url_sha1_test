include(hunter_download_server_url)

set(half_url "https://github.com/hunter-packages/half/archive/v1.1.0-p1.tar.gz")
set(half_sha1 "bc445fc2b91c7a2c4ea0025012068ecab18ef36d")

option(URL_FIX "Test HUNTER_DOWNLOAD_SERVER fix" OFF)
if(URL_FIX)
  hunter_download_server_url(
    PACKAGE half
    VERSION ${half_sha1}
    SHA1 ${half_sha1}
    URL ${half_url}
    OUTPUT half_url_final
  )
  hunter_config(half URL ${half_url_final} SHA1 ${half_sha1})
else()
  hunter_config(half URL ${half_url} SHA1 ${half_sha1})
endif()




