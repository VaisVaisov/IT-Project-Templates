# Universal Hybrid C/C++/Cython/Python Project Template

Шаблон для production-ready проектов с поддержкой:
- C / C++
- Cython
- Python
- Тестов (pytest, GoogleTest)
- CI/CD (GitHub Actions)
- Документации (Doxygen, Sphinx)
- Профилирования
- Автоматизации

---

## 🛠 Сборка

### Вариант 1: Через CMake
mkdir build && cd build
cmake ..
make

Бинарники: bin/

### Вариант 2: Через setup.py (рекомендуется для Cython)
python setup.py build_ext --inplace

---

## 🧪 Тесты

### Python
sphinx-quickstart

### C++
cd build
ctest --output-on-failure

---

## 🚀 CI/CD

GitHub Actions запускает:
- Сборку
- C++ тесты
- Python тесты
- Документацию

Конфиг: .github/workflows/ci.yml

---

## 📊 Профилирование

scripts/profile.sh

---

## 📦 Зависимости
pip install -r requirements.txt

---

## 🧰 Автоматизация
./new-project.sh MyNewProject
Создаст проект с виртуальным окружением и зависимостями.

---

## 📁 Структура

```
project/
├── .github                             # GitHub Actions (CI/CD)
├── bin/                                   # Бинарники
├── lib/                                    # Статические и динамические библиотеки
├── include/                          # Заголовочные файлы
├── src/                                  # C/C++
├── cython/                          # Cython-модули
├── python/                         # Python-скрипты
├── tests/                              # Все тесты
├── docs/                              # Документация
├── libraries/                        # Сторонние библиотеки
├── .clang-format
├── .clang-tidy
├── .gitignore
├── CMakeLists.txt.in       # Шаблон CMakeLists.txt
├── CMakePresets.json   # CMake-профили для CLion
├── Doxyfile                         # Шаблон Doxyfile
├── README.MD
├── requirements.txt       # Зависимости для Python
├── tools/
         └── profiler /                # Профилирование
└── scripts/                           # Скрипты
```

---

## ⚙️ Как начать

### 1. Создай проект из шаблона

new-project MyHybridApp

> Убедись, что скрипт new-project установлен и работает.
> Если необходимо установить, new-project.sh лежит в корне репозитория

---

### 2. Активируй виртуальное окружение и установи зависимости
```
cd project_name
source .venv/bin/activate  # Linux/macOS
```
# или
```
.venv\Scripts\activate     # Windows

pip install -r requirements.txt
```

---

### 3. Собери проект
```
mkdir build && cd build
cmake ..
make
```
→ Бинарники появятся в ../bin/.

---

### 4. Запусти Python-скрипт
```
python ../python/main.py
```
---

## 🧩 Пример: вызов C++ из Python через Cython

**C++:**
```
// src/cpp/math.cpp
int add(int a, int b) { return a + b; }
```

**Cython:**
```
# cython/wrapper.pyx
cpdef int call_add(int a, int b):
    return cpp_add(a, b)
```

**Python:**
```
import wrapper
print(wrapper.call_add(2, 3))  # 5
```

---

## 🔧 Поддержка NumPy

Передача массивов без копирования:

```
def process_array(np.ndarray[np.int32_t, ndim=1] arr):
    cdef int* data = <int*>arr.data
    cdef int size = arr.shape[0]
    process_in_c(data, size)  # C-функция
```
---

## 📦 Упаковка в standalone-приложение

```
pip install pyinstaller
pyinstaller --onefile --paths=bin python/main.py
```

→ Создаст dist/main — можно запускать без Python.

---

## 🧪 Рекомендации

- Используй .venv — не захламляй систему
- Все бинарники — в bin/
- Не коммить .venv/, build/, __pycache__ — они в .gitignore
- Для новых проектов — всегда используй new-project <name>

---

## 🙌 Автор

Создано с ❤️ для тех, кто хочет писать быстро, думать системно и строить мощные приложения.

---