# Contributing

Thank you for contributing to this STM32F411 BlackPill (PlatformIO) project template!

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

# Upload via ST-Link
pio run --target upload

# Upload via DFU
pio run --target upload --upload-protocol dfu

# Serial monitor
pio device monitor --baud 115200

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

Note: Wokwi supports STM32 Nucleo boards. The `diagram.json` uses `board-st-nucleo-f411re` as the closest equivalent. Adjust as needed.

## Workflow

1. Create a branch: `git checkout -b feat/my-feature`
2. Make changes
3. Run checks: `pre-commit run --all-files && pio run`
4. Commit using [Conventional Commits](https://www.conventionalcommits.org/)
5. Open a Pull Request

## Commit Convention

```
feat: add DMA transfer for ADC readings
fix: fix SPI clock polarity
docs: update memory map
test: add test for UART parser
chore: bump STM32 HAL version
```

## Questions

Open an [Issue](../../issues) or [Discussion](../../discussions).
