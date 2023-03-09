set_languages("c++2a")
add_rules("mode.debug", "mode.release")

set_warnings("all", "error")

set_optimize("fastest")
-- add_cxflags("-stdnolib", "-fno-strict-aliasing")

add_includedirs("include", "/usr/local/include", "/usr/include")

-- add libraries
local project_libs = { "fmt", "cxxopts" }
local test_libs = { "gtest" }
local bench_libs = { "benchmark" }

add_requires(table.unpack(project_libs))
add_requires(table.unpack(test_libs))
add_requires(table.unpack(bench_libs))

-- main project library
target("libciphervault")
set_kind("static")
add_files("src/**/*.cpp")
add_packages(table.unpack(project_libs))

-- main project executable
target("ciphervault")
set_kind("binary")
add_files("src/main.cpp")
add_packages(table.unpack(project_libs))
add_deps("libciphervault")

-- test suites
target("test")
set_kind("binary")
add_files("test/**/*.cpp", "test/main.cpp")
add_packages(table.unpack(test_libs))
add_deps("libciphervault")

-- benchmarks
target("bench")
set_kind("binary")
add_files("bench/**/*.cpp", "bench/main.cpp")
add_packages(table.unpack(bench_libs))
add_deps("libciphervault")

--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--
