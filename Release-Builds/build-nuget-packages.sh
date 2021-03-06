#!/usr/bin/env bash
set -e # exit on first error
set -u # exit on using unset variable

# ************* Begin CORE *********************************************
# http://docs.nuget.org/docs/creating-packages/creating-and-publishing-a-package

mkdir -p build-output
rm -rf build-output/*.nupkg
# Core reporting nuget package
cd nuget/MajorsilenceReporting-Core
rm -rf lib
rm -rf content
rm -rf ../MajorsilenceReporting-Core-Build

mkdir -p lib
mkdir -p content
cd lib
mkdir -p net40
cd ..

cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/DataProviders.dll lib/net40/DataProviders.dll
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlCri.dll lib/net40/RdlCri.dll
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlEngine.dll lib/net40/RdlEngine.dll
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/DataProviders.xml lib/net40/DataProviders.xml
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlCri.xml lib/net40/RdlCri.xml
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlEngine.xml lib/net40/RdlEngine.xml
# make this a nuget dependency ../RdlEngine/bin/Release/ICSharpCode.SharpZipLib.dll ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/ICSharpCode.SharpZipLib.dll /Y

# make this a nuget dependency copy "../References/dot net 4/itextsharp.dll" ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/itextsharp.dll /Y
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlEngineConfig.xml content/RdlEngineConfig.xml
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlEngineConfig.Linux.xml content/RdlEngineConfig.Linux.xml


mkdir -p lib/net40/ru-RU
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/ru-RU/RdlEngine.resources.dll lib/net40/ru-RU/RdlEngine.resources.dll


cd ..
CURRENTPATH=`pwd`
nuget pack "$CURRENTPATH/MajorsilenceReporting-Core/MajorsilenceReporting-Core.nuspec" -OutputDirectory "$CURRENTPATH/../build-output"

cd ..

# ************* End CORE *********************************************




# ************* Begin Viewer *********************************************
# make a seperate package 

cd nuget/MajorsilenceReporting-Viewer
rm -rf lib
rm -rf content
rm -rf ../MajorsilenceReporting-Viewer-Build


mkdir -p lib
cd lib
mkdir net40
cd ..

cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlViewer.dll lib/net40/RdlViewer.dll
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlViewer.xml lib/net40/RdlViewer.xml

mkdir -p lib/net40/ru-RU
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/ru-RU/RdlViewer.resources.dll lib/net40/ru-RU/RdlViewer.resources.dll

cd ..

nuget pack "$CURRENTPATH/MajorsilenceReporting-Viewer/MajorsilenceReporting-Viewer.nuspec" -OutputDirectory "$CURRENTPATH/../build-output"

cd ..


# ************* End Viewer *********************************************




# ************* Begin Asp.net *********************************************
# make a seperate package 

cd nuget/MajorsilenceReporting-Asp
rm -rf lib
rm -rf content


mkdir -p lib
cd lib
mkdir net40
cd ..

cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlAsp.dll lib/net40/RdlAsp.dll
cp -f ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/RdlAsp.xml lib/net40/RdlAsp.xml

cd ..

nuget pack "$CURRENTPATH/MajorsilenceReporting-Asp/MajorsilenceReporting-Asp.nuspec" -OutputDirectory "$CURRENTPATH/../build-output"

cd ..


# ************* End Asp.net *********************************************




# ************* Begin XwtViewer *********************************************
# make a seperate package 

cd nuget/MajorsilenceReporting-XwtViewer
rm -rf lib
rm -rf content


mkdir -p lib
cd lib
mkdir net40
cd ..


cp ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/LibRdlCrossPlatformViewer.dll lib/net40/LibRdlCrossPlatformViewer.dll
cp ../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/LibRdlCrossPlatformViewer.xml lib/net40/LibRdlCrossPlatformViewer.xml
cp "../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/Xwt.dll" lib/net40/Xwt.dll
cp "../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/Xwt.Gtk.dll" lib/net40/Xwt.Gtk.dll
cp "../../build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/Xwt.WPF.dll" lib/net40/Xwt.WPF.dll

cd ..

nuget pack "$CURRENTPATH/MajorsilenceReporting-XwtViewer/MajorsilenceReporting-XwtViewer.nuspec" -OutputDirectory "$CURRENTPATH/../build-output"

cd ..


# ************* End XwtViewer *********************************************


# future nuget packages



# make a seperate package copy ../LibRdlWpfViewer/bin/Release/LibRdlWpfViewer.dll ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/LibRdlWpfViewer.dll /Y

# make a separate package copy ../LibRdlCrossPlatformViewer/bin/Release/LibRdlCrossPlatformViewer.dll ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/LibRdlCrossPlatformViewer.dll /Y
# copy "../References/dot net 4/Xwt.dll" ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/Xwt.dll /Y
# copy "../References/dot net 4/Xwt.Gtk.dll" ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/Xwt.Gtk.dll /Y
# copy "../References/dot net 4/Xwt.WPF.dll" ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/Xwt.WPF.dll /Y
# copy "../References/dot net 3.5/zxing.dll" ./build-output/majorsilence-reporting-build-dot-net-4-AnyCPU/zxing.dll /Y
