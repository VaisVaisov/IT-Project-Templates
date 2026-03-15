# Contributing

Thank you for contributing to this C/C++ project template!

## Getting Started

```sh
git clone --recurse-submodules <your-fork>
cd <project>
pre-commit install
```

## Build System

```sh
# Debug build + tests
cmake --preset linux-debug && cmake --build --preset linux-debug
cd cmake-build-linux-debug && ctest --output-on-failure

# Release build
cmake --preset linux-release && cmake --build --preset linux-release

# Coverage
cmake --preset linux-coverage && cmake --build --preset linux-coverage
cd cmake-build-linux-coverage && ctest
lcov --capture --directory . --output-file coverage.info
```

## Workflow

1. Create a branch: `git checkout -b feat/my-feature`
2. Make changes, write tests (GoogleTest via CTest)
3. Run checks:
   ```sh
   pre-commit run --all-files
   cmake --preset linux-debug && cmake --build --preset linux-debug
   cd cmake-build-linux-debug && ctest
   ```
4. Commit using [Conventional Commits](https://www.conventionalcommits.org/)
5. Open a Pull Request

## Commit Convention

```
feat: add new feature
fix: fix a bug
docs: update documentation
test: add or update tests
refactor: refactor code
perf: performance improvement
chore: maintenance tasks
```

## Code Style

- `clang-format` via pre-commit (LLVM style)
- `cppcheck` static analysis
- `valgrind` memcheck via pre-commit hook

## Questions

Open an [Issue](../../issues) or [Discussion](../../discussions).
