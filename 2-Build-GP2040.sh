#! /bin/bash

# PLEASE NOTE
# The following line must be changed depending on which pico board is used:
export GP2040_BOARDCONFIG=WaveshareZero
# Supported Boards (choose one):
# ARCController, Pico, BentoBox, FightboardV3, FightboardV3Mirrored, 
# FlatboxRev4, FlatboxRev5, FlatboxRev5RGB, FlatboxRev5Southpaw, Granola, 
# KB2040, KeyboardConverter, Haute42COSMOX, Liatris, Mavercade, OpenCore0, 
# OpenCore0WASD, PicoAnn, PicoFightingBoard, RanaTadpole, ReflexCtrlGenesis6, 
# ReflexCtrlNES, ReflexCtrlSaturn, ReflexCtrlSNES, ReflexCtrlVB, ReflexEncodeV1.2, 
# ReflexEncodeV2.0, RP2040AdvancedBreakoutBoard, RP2040AdvancedBreakoutBoardUSBPassthrough, 
# RP2040MiniBreakoutBoard, SparkFunProMicro, WaveshareZero, Stress, SGFDevices

export PICO_SDK_PATH=$HOME/pico-sdk/
. $HOME/.nvm/nvm.sh

# clean install
cd $HOME/GP2040-CE/www/
npm ci

# Build WWW
CI=false npm run build --if-present
cd ..

# Pico Build Configure CMake
SKIP_WEBBUILD=TRUE cmake -B ./build -DCMAKE_BUILD_TYPE=Release

# Pico Build
cmake --build ./build --config Release
cd ..
