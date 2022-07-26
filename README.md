Example cmake project structure with components and GoogleTest support
======================================================================

- Florian Dupeyron &lt;florian.dupeyron@mugcat.fr&gt;
- July 2022

This repo contains an example project structure with individual components that can be tested using [googletest](https://google.github.io/googletest/).
It is thought with crosscompilation in mind, especially targetting embedded software projects.

Component testing is done using a specific configuration (`ComponentTesting`). For this specific configuration, multi-config generators (such as `Ninja Multi-Config`)
are not supported.

The ideal workflow is to generate two build folders, for instance:

**To compile for target:**

```bash
> cmake "-GNinja Multi-Config" -B build-oper src/
> cmake --build build-oper --config Debug
> cmake --build build-oper --config Release
```

**To test components locally on host:**

```bash
> cmake -GNinja -DCMAKE_BUILD_TYPE="ComponentTesting" -B build-tests src
> cmake --build build-tests
> cd build-tests
> ctest
```

Using the docker image
----------------------

A docker image is provided as an example on how a specific docker environment can be built
for component testing.

**First, build the docker image**:

```bash
> docker build -t buildenv:componentTesting -f docker/Dockerfile_componentTesting ./docker
```

**Then, run the tests using the provided script**

```bash
> ./run_tests_docker.sh
```
