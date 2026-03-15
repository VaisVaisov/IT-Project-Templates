# Contributing

Thank you for contributing to this C/C++ + Python hybrid project template!

## Getting Started

```sh
git clone <your-fork>
cd <project>
uv sync
pre-commit install
```

## Build System

```sh
# Debug build
cmake --preset linux-debug && cmake --build --preset linux-debug

# Run tests
cd cmake-build-linux-debug && ctest --output-on-failure

# Python extension
uv run pytest --cov
```

## Workflow

1. Create a branch: `git checkout -b feat/my-feature`
2. Make changes, write tests (C++ via CTest, Python via pytest)
3. Run checks:
   ```sh
   pre-commit run --all-files
   cmake --preset linux-debug && cmake --build --preset linux-debug
   cd cmake-build-linux-debug && ctest
   uv run pytest --cov
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

- C/C++: `clang-format` via pre-commit
- Python: `ruff`, `mypy`, `pylint` via pre-commit

## Questions

Open an [Issue](../../issues) or [Discussion](../../discussions).
