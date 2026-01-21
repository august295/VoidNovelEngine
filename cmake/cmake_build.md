# cmake 编译



## Windows

### 环境

- VS2022
- CMake3.15+

### 编译

```
# 构建工程
cmake -B"build" -G"Visual Studio 17 2022"

# 编译工程
cmake --build build --config Release -j 4 
```

运行编译结果在 `build/bin` 目录下



## Linux

### 环境

- gcc/g++ 8.0+
- Ninja
- CMake3.15+
- vcpkg

### 配置

```
# 下载并构建 vcpkg
cd $HOME
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg/
./bootstrap-vcpkg.sh

# 环境配置
echo 'export VCPKG_ROOT="$HOME/vcpkg"' >> ~/.bashrc
source ~/.bashrc
```

编译依赖文件统一下载 `vcpkg.json`

```json
{
    "dependencies": [
        "lua",
        "raylib",
        "sdl2",
        "sdl2-ttf",
        "sdl2-image",
        "sdl2-mixer",
        "sdl2-net",
        "sdl2-gfx"
    ],
    "builtin-baseline": "6f29f12e82a8293156836ad81cc9bf5af41fe836",
    "overrides": [
        {
            "name": "lua",
            "version": "5.4.7"
        },
        {
            "name": "raylib",
            "version": "5.5"
        },
        {
            "name": "sdl2",
            "version": "2.32.4"
        }
    ]
}
```

下载依赖

```
# 环境下载
sudo apt install -y gcc g++ gdb cmake ninja-build 
sudo apt install -y libxinerama-dev libxcursor-dev xorg-dev libglu1-mesa-dev pkg-config
sudo apt install -y autoconf automake libtool
sudo apt install -y libarchive-dev python3-distutils python3-setuptools
sudo apt install -y python3-distutils python3-setuptools python3-dev
pip3 install jinja2

# vcpkg 下载
vcpkg install --x-install-root=$VCPKG_ROOT/installed
```

### 编译

```
# 构建工程
cmake -B"build" -G"ninja" -D"CMAKE_BUILD_TYPE=Release"

# 编译工程
cmake --build build --config Release -j 4 
```

运行编译结果在 `build/bin` 目录下
