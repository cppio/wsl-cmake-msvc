# wsl-cmake-msvc
CMake Toolchain to use MSVC from WSL

## Usage
Clone this repository to a known location e.g. `~/.local/share/wsl-cmake-msvc`.
Then, when calling `cmake`, pass
```
-DCMAKE_TOOLCHAIN_FILE=~/.local/share/wsl-cmake-msvc/x64/wsl-msvc.cmake
```
with the appropriate path and architecture.
