#!/usr/bin/env bash
lastTag=$(git describe --tags `git rev-list --tags --max-count=1`)
echo $lastTag > version.txt
# Linux
GO_ENABLED=0 GOOS=linux GOARCH=amd64
target="hotbuild_${lastTag}_${GOOS}_${GOARCH}"
go build -ldflags="-X 'main.Version=$lastTag'" -o ./build/$target/ 
cd build/
zip -mr  $target.zip $target 
cd ..
# macosx
GO_ENABLED=0 GOOS=darwin GOARCH=amd64
target="hotbuild_${lastTag}_${GOOS}_${GOARCH}"
go build -ldflags="-X 'main.Version=$lastTag'" -o ./build/$target/ 
cd build/
zip -mr  $target.zip $target 
cd ..
# windows
GO_ENABLED=0 GOOS=windows GOARCH=amd64
target="hotbuild_${lastTag}_${GOOS}_${GOARCH}"
go build -ldflags="-X 'main.Version=$lastTag'" -o ./build/$target/ 
cd build/
zip -mr  $target.zip $target 
cd ..
