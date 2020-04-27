# wsl-cmake-msvc
CMake Toolchain to use MSVC from WSL

## Usage
Clone this repository to a known location e.g. `~/.local/share/wsl-cmake-msvc`.
Then, when calling `cmake`, pass
```
-DCMAKE_TOOLCHAIN_FILE=~/.local/share/wsl-cmake-msvc/x64/wsl-msvc.cmake
```
with the appropriate path and architecture.

### Configuration
You may have to change the configuration before using the toolchain.
The configuration is located in `config.sh`.
The path to `MSVC` depends on the version of Visual Studio and whether the full IDE was installed or only the build tools.
