# Contributing

Thank you for contributing to this Arduino Pro Micro (PlatformIO) project template!

## Getting Started

```sh
git clone <your-fork>
cd <project>
pip install platformio
pre-commit install
```

## Build & Flash

```sh
# Build firmware
pio run

# Upload to device
pio run --target upload

# Serial monitor
pio device monitor

# Run tests
pio test

# Check firmware size
pio run --target size

# Static analysis
pio check
```

## Wokwi Simulation

Install [Wokwi CLI](https://docs.wokwi.com/wokwi-ci/getting-started) and add your token:
```sh
wokwi-cli simulate --timeout 10000
```

The `diagram.json` defines the circuit. Edit it at [wokwi.com](https://wokwi.com).

## Workflow

1. Create a branch: `git checkout -b feat/my-feature`
2. Make changes
3. Run checks: `pre-commit run --all-files && pio run`
4. Commit using [Conventional Commits](https://www.conventionalcommits.org/)
5. Open a Pull Request

## Commit Convention

```
feat: add USB HID keyboard report
fix: fix debounce logic
docs: update pin mapping
test: add test for key matrix scanning
chore: bump PlatformIO libraries
```

## Questions

Open an [Issue](../../issues) or [Discussion](../../discussions).
