#!/bin/bash
set -e

cd "$(dirname "$0")"

echo ""
echo "==============================================================="
echo "   NOICE - The Digital Void (C# Speed Up Edition)"
echo "==============================================================="
echo ""

if ! dotnet --version &>/dev/null; then
    echo "[ERROR] .NET SDK not found"
    echo "Please install .NET 8 SDK: https://dotnet.microsoft.com/download"
    exit 1
fi

echo "[OK] .NET found"
echo ""

mkdir -p uploads processed_videos

echo "[INFO] Building C# server..."
dotnet build NoiceServer/NoiceServer.csproj -c Release -v q

echo ""
echo "==============================================================="
echo "   Starting server..."
echo "   Open http://127.0.0.1:8000 in your browser"
echo "   (Download: ffmpeg must be in PATH for audio muxing)"
echo "==============================================================="
echo ""

dotnet run --project NoiceServer/NoiceServer.csproj -c Release --no-build

echo ""
echo "Server stopped"
