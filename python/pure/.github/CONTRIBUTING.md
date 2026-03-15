# Contributing

Thank you for contributing to this Python project template!

## Getting Started

```sh
# Clone and set up the dev environment
git clone <your-fork>
cd <project>
uv sync
pre-commit install
```

## Workflow

1. Create a branch: `git checkout -b feat/my-feature`
2. Make changes, write tests
3. Run checks locally:
   ```sh
   pre-commit run --all-files
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
chore: maintenance tasks
```

## Code Style

This project uses `ruff` (linting + formatting), `mypy` (type checking), and `pylint`. All checks run via pre-commit.

## Running Tests

```sh
uv run pytest --cov=src --cov-report=term-missing
```

## Questions

Open an [Issue](../../issues) or [Discussion](../../discussions).
