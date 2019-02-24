import os
import sys
from shutil import copytree, rmtree

env = DefaultEnvironment()

# Link libraries
WIN_LIBS = ["user32"]

# Compiler/Linker flags
WIN_CXXFLAGS = "/Isrc/ /std:c++17 /FS /ZI /W2 /EHsc"

# Common data
FILENAME = "bin/inside-noclip.exe"
SOURCES = Glob("src/*.cpp")
SOURCES.extend(Glob("src/**/*.cpp"))
BIN_PATH = "./bin"

def pre_build():
    platform = sys.platform
    print("--- Building for " + platform)
    try:
        os.mkdir(BIN_PATH)
    except Exception:
        pass

def build():
    Program(
        FILENAME,
        SOURCES,
        CXXFLAGS = WIN_CXXFLAGS,
        LIBS = WIN_LIBS,
        CPPPATH = "./include",
        LIBPATH = "./lib",
    )

build()
