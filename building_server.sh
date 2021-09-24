BASEDIR="/data/triton"

WORKDIR="$BASEDIR/workspace_server"

TRITON_COMMON_REPO_TAG=main
TRITON_CORE_REPO_TAG=main
TRITON_THIRD_PARTY_REPO_TAG=main
TRITON_BACKEND_REPO_TAG=main

SOURCE_DIR=$BASEDIR/server
echo "source dir: ${SOURCE_DIR}"
/bin/rm -rf "$WORKDIR" && mkdir -p $WORKDIR
cd $WORKDIR
cp -r ${SOURCE_DIR}/* .

#/bin/rm -rf "$WORKDIR/building" && mkdir -p $WORKDIR/building
mkdir -p $WORKDIR/building
mkdir -p $WORKDIR/install

version="r21.06"
upstream_container_version="21.06"
build_parallel=10


#./build.py --no-container-build --enable-gpu --build-parallel=$build_parallel --cmake-dir=$WORKDIR/build --build-dir=$WORKDIR/building --install-dir=$WORKDIR/install --enable-logging --enable-stats --enable-tracing --enable-metrics --enable-gpu-metrics --endpoint=http --endpoint=grpc --repo-tag=common:main --repo-tag=core:main --repo-tag=backend:main --repo-tag=thirdparty:main --backend=ensemble --backend=onnxruntime:main --repoagent=checksum:main



#./build.py --no-container-build --enable-gpu --build-parallel=$build_parallel --cmake-dir=$WORKDIR/build --build-dir=$WORKDIR/building --install-dir=$WORKDIR/install --enable-logging --enable-stats --enable-tracing --endpoint=http --endpoint=grpc --repo-tag=common:$version --repo-tag=core:$version --repo-tag=backend:$version --repo-tag=thirdparty:$version --backend=ensemble --backend=onnxruntime:$version --repoagent=checksum:$version


backends=" --backend=ensemble --backend=tensorrt:$version --backend=tensorflow2:$version --backend=tensorflow1:$version --backend=pytorch:$version --backend=openvino:$version --backend=repeat:$version "

perf_trace=" --enable-logging --enable-stats --enable-tracing --enable-metrics --enable-gpu-metrics "
perf_trace=" --enable-logging --enable-stats --enable-tracing "

./build.py --no-container-build --enable-gpu --upstream-container-version="$upstream_container_version" --build-parallel=$build_parallel --cmake-dir=$WORKDIR/build --build-dir=$WORKDIR/building --install-dir=$WORKDIR/install $perf_trace --endpoint=http --endpoint=grpc --repo-tag=common:$version --repo-tag=core:$version --repo-tag=backend:$version --repo-tag=thirdparty:$version $backends  --repoagent=checksum:$version
