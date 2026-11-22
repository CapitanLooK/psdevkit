# psdevkit

Docker toolchains for PlayStation 1 and PlayStation 2 homebrew (C).

This repo only provides the build environment. Put your own project under this folder (or mount it) and compile inside the container.

| Target | SDK |
|--------|-----|
| PS1 | [PSn00bSDK](https://github.com/Lameguy64/PSn00bSDK) 0.24 |
| PS2 | [ps2dev](https://github.com/ps2dev/ps2dev) / [ps2sdk](https://github.com/ps2dev/ps2sdk) |

PSn00bSDK is PS1-only. PS2 needs ps2dev.

---

## English

### Requirements

- Docker Engine + Docker Compose v2
- Make (optional; you can call `docker compose` directly)

Works on Linux (Ubuntu, Fedora, …), macOS, and Windows with Docker Desktop / WSL2.

### Setup

```bash
git clone https://github.com/CapitanLooK/psdevkit.git
cd psdevkit
make prepare
```

First run downloads and builds the images. It can take several minutes.

### Usage

```bash
make shell-ps1   # bash with PSn00bSDK (CMake / Ninja)
make shell-ps2   # bash with ps2dev / ps2sdk
```

The repo root is mounted at `/workspace`.

Typical flow:

1. Copy or clone your game into this repo (or open a shell and clone into `/workspace`).
2. Enter the matching shell.
3. Build with your project's usual commands (CMake for PSn00bSDK, Make for ps2sdk).

Without Make:

```bash
docker compose build
docker compose run --rm ps1
docker compose run --rm ps2
```

### Cursor / VS Code

1. Install the Dev Containers extension.
2. **Dev Containers: Reopen in Container**
3. Pick **PS1 — PSn00bSDK** or **PS2 — ps2dev**

### Layout

```
psdevkit/
├── docker-compose.yml
├── docker/ps1/Dockerfile
├── docker/ps2/Dockerfile
├── .devcontainer/ps1/
└── .devcontainer/ps2/
```

### Make targets

| Target | Action |
|--------|--------|
| `make prepare` | Build both images |
| `make prepare-ps1` | Build PS1 image |
| `make prepare-ps2` | Build PS2 image |
| `make shell-ps1` | Shell with PSn00bSDK |
| `make shell-ps2` | Shell with ps2dev |

### Emulators

- PS1: [DuckStation](https://www.duckstation.org/) (`.bin` / `.cue`)
- PS2: [PCSX2](https://pcsx2.net/) (`.elf`)

You need your own BIOS dumps where the emulator requires them. This project does not ship BIOS or commercial game data.

### License

See [LICENSE](LICENSE). Upstream SDKs keep their own licenses (PSn00bSDK, ps2dev/ps2sdk).

---

## Español

### Requisitos

- Docker Engine + Docker Compose v2
- Make (opcional; también podés usar `docker compose` directo)

Sirve en Linux (Ubuntu, Fedora, …), macOS y Windows con Docker Desktop / WSL2.

### Instalación

```bash
git clone https://github.com/CapitanLooK/psdevkit.git
cd psdevkit
make prepare
```

La primera vez descarga y construye las imágenes. Puede tardar varios minutos.

### Uso

```bash
make shell-ps1   # bash con PSn00bSDK (CMake / Ninja)
make shell-ps2   # bash con ps2dev / ps2sdk
```

La raíz del repo se monta en `/workspace`.

Flujo típico:

1. Copiá o cloná tu juego dentro de este repo (o abrí el shell y cloná en `/workspace`).
2. Entrá al shell que corresponda.
3. Compilá con los comandos de tu proyecto (CMake para PSn00bSDK, Make para ps2sdk).

Sin Make:

```bash
docker compose build
docker compose run --rm ps1
docker compose run --rm ps2
```

### Cursor / VS Code

1. Extensión Dev Containers.
2. **Dev Containers: Reopen in Container**
3. Elegí **PS1 — PSn00bSDK** o **PS2 — ps2dev**

### Estructura

```
psdevkit/
├── docker-compose.yml
├── docker/ps1/Dockerfile
├── docker/ps2/Dockerfile
├── .devcontainer/ps1/
└── .devcontainer/ps2/
```

### Targets de Make

| Target | Acción |
|--------|--------|
| `make prepare` | Construye ambas imágenes |
| `make prepare-ps1` | Imagen PS1 |
| `make prepare-ps2` | Imagen PS2 |
| `make shell-ps1` | Shell con PSn00bSDK |
| `make shell-ps2` | Shell con ps2dev |

### Emuladores

- PS1: [DuckStation](https://www.duckstation.org/) (`.bin` / `.cue`)
- PS2: [PCSX2](https://pcsx2.net/) (`.elf`)

El BIOS lo tenés que aportar vos si el emulador lo pide. Este proyecto no incluye BIOS ni datos de juegos comerciales.

### Licencia

Ver [LICENSE](LICENSE). Los SDKs upstream mantienen sus propias licencias (PSn00bSDK, ps2dev/ps2sdk).
