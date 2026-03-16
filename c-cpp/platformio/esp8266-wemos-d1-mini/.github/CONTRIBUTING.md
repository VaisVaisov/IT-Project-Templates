# Contributing

Thank you for contributing to this ESP32 DevKit (PlatformIO) project template!

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

# Upload over USB
pio run --target upload

# Upload over WiFi (OTA)
pio run --target upload --upload-port <ip-address>

# Serial monitor
pio device monitor --baud 115200

# Run tests (native)
pio test -e native

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
feat: add MQTT publish on sensor threshold
fix: fix WiFi reconnect race condition
docs: update pinout diagram
test: add test for JSON parser
chore: bump ESP-IDF version
```

## Questions

Open an [Issue](../../issues) or [Discussion](../../discussions).
