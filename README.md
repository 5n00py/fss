# FunkyShellSearch (fss) ♫♪♪♫♪♪

FunkyShellSearch (fss) is designed to improve your command-line search
experience. It integrates powerful find and grep utilities like `fd`, `ag` and
`pdfgrep` with the intuitive fzf fuzzy finder. The goal is to create a more
user-friendly and interactive shell-based search environment.

As an ongoing project, FunkyShellSearch will continue to evolve with additional
scripts, features, and documentation, further enriching the file searching and
handling capabilities within the shell environment.

Stay tuned for updates!

## Key Features

- **Versatile Librariees:** At the heart of fss are robust libraries that offer
  easy integration into shell scripts. They enable to construct customized
  shell search commands.
- **Ready-to-Use Scripts:** A suite of sample tools is offered which consists of
  tailor-made scripts for specific file types such as music, videos, images and
  PDFs, providing plug-and-play solutions out of the box.
- **Advanced File Discovery:** Beyond the basic search functionality the scripts
  offer enriched features such as file previews and the ability to directly
  open files with appropriate applications.
- **Configurable Search Operations:** Each script dynamically adapts to various
  file types by loading specific settings from a dedicated configuration file.
  This approach faciliates customization of preview options, file-opening
  commands and other search preferences and requirements.

## Dependencies

The functionalities of FuzzyShellSearch scripts depend on several external
tools. Below is the list of dependencies, based on the standard
configuration:

### Basic Search Tools

- [fd](https://github.com/sharkdp/fd): A simple, fast, and user-friendly
  alternative to `find`. 
  **Important Note:**: On certain Linux distributions,
  such as Debian, the `fd` command might be named `fdfind` or simlar, due to
  naming conflicts. In such cases, creating a symbolic link for `fd` or
  modifying the command name in the [fss.conf](/config/fss.conf) file is
  necessary, as simple aliasing will not suffice.
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder for
  efficient file searching.
- [grep](https://www.gnu.org/software/grep/): A versatile pattern matching and
  search utility for filtering text.
- [pdfgrep](https://pdfgrep.org): Used in `gpdf` for searching within PDF
  files.

### Additional Utilities and Tools

- [chafa](https://github.com/hpjansson/chafa/): For image previews in the `fzf`
  interface for images.
- [feh](https://feh.finalrewind.org): A fast image viewer for opening selected
  image files.
- [mediainfo](https://mediaarea.net/en/MediaInfo): Provides detailed
  information on video files.
- [mpv](https://github.com/mpv-player/mpv): A media player for audio
  playbacks.
- [pdftotext](https://www.xpdfreader.com/pdftotext-man.html): Converts PDF
  pages to text for previews in PDF searches.
- [zathura](https://pwmt.org/projects/zathura/)

**Note:** Some of these dependencies are based on the default configuration of
the scripts and might change if you modify the `fss.conf` configuration file.
Adjust the dependencies accordingly based on your custom configuration.

## Installation

### 1. Clone the Repository 

Clone the fss repository from GitHub. You can do this using either
HTTPS or SSH. Choose the method that suits your setup:

- *Using HTTPS:* 
  ```bash 
  git clone https://github.com/5n00py/fss.git
  ```

- *Using SSH:* 
  ```bash 
  git clone git@github.com:5n00py/fss.git
  ```

### 2. Make the Scripts Executable 

Ensure the scripts in the tools directory are executable.

```bash
chmod +x /path/to/fss/tools/*
```

Don't forget to replace `/path/to/fss` with the actual path.

### 3. Add the Scripts Your PATH 

Set the `FSS_ROOT_DIR` environment variable to the path of the cloned `fss`
repository. This allows the scripts to correctle source configurations and
libraries.
```bash
export FSS_ROOT_DIR="$HOME/path/to/fss"
```

Include the `fss` tools directory in your `PATH` for convenient access to the
scripts:

```bash
export PATH="$FSS_ROOT_DIR/tools:$PATH"
```

*Note:* Don't forget to replace `/path/to/fss` with the actual path to the
`fss` project.

To make these changes permanent, append the above export commands to your 
shell's configuration file (such as `~/.bashrc` for Bash or `~/.zshrc` for Zsh).

Apply the changes by reloading your shell configuration:

```bash
source ~/.bashrc    # For Bash
source ~/.zshrc     # For Zsh
```

## Configuration

The fss project comes equipped with a default configuration file, [fss.conf](/config/fss.conf),
which is sources automatically by the project's scripts. This default
configuration sets up the essential parameters for the tool's operation.

To personalize the configs according to your needs follow these steps:

1. Copy the default configuration file into your own `.config/fss` directory.
   This allows you to modify settings without affecting the original
   configuration:

   ```bash
   mkdir -p ~/.config/fss
   cp /path/to/fss/config/fss.conf ~/.config/fss/fss.conf
   ```
   *Note:* Replace `/path/to/fss` with the actual path to the `fss` project.

2. To edit the custom configuration open the copied `fss.conf` file in your
   preferred text editor:

   ```bash
   nvim ~/.config/fss/fss.conf
   ```

3. Within the `fss.conf` file you have now the freedom to specify settings
   which fit your workflow.

Fss will prioritize the configuration file located at `~/.config/fss/fss.conf`
if it is present.

## Tools Overview

Each script in `fss/tools` offers an efficient approach to searching,
previewing, and taking action on various file types. Below, the scripts are
described in more detail as for the default configuration:

### `fimage`
- **Search:** Uses `fd` to locate image files, supporting search pattern
  refinement.
- **Preview:** Features `chafa` for image previews in the `fzf` interface.
- **Action on Selection:** Opens the selected image in `feh`.

### `fkill`
- **Search:** Interactively displays a list of running processes using `ps` and 
  allows optional keyword-based filtering.
- **Action on Selection:** Offers the ability to kill the selected process with 
  the kill command `kill -9 [PID]`.

### `fmusic`
- **Search:** Uses `fd` to recursively find music files from the current
  directory, optionally filterable by pattern.
- **Preview:** Integrates `mpv` in `fzf` for audio previews of the search
  results.
- **Action on Selection:** Plays the selected music file using `mpv`.

### `fvideo`
- **Search:** Uses `fd` to search for video files from the current directory,
  optionally filterable by pattern.
- **Preview:** Integrates `mediainfo` in `fzf` for detailed information on
  video files.
- **Action on Selection:** Opens and plays the chosen video file using `mpv`.

### `ghist`
- **Search:** Uses `grep` to search for specified patterns of commands in the
  shell history file (default is `~/.zshrc`).
- **Action on Selection:** Copies the selected command from the history to the
  clipboard using `xclip`. You can then paste and execute it directly in the 
  terminal.

### `gpdf`
- **Search:** Uses `pdfgrep` to search for a specified pattern in PDF files 
  within the current directory and its subdirectories. If no pattern is
  provided it performs a `find` search for all PDF files.
- **Preview:** Offers a text preview within `fzf` using `pdftotext`.
- **Action on Selection:** Opens the selected PDF file at the specific page 
  where the pattern was found, using `zathura` (or the first page if no pattern
  provided).

Each script's behavior can be customized via the `fss.conf` configuration file,
allowing modifications to file extensions, preview commands, and default
actions.

## Usage

Each script can be run directly from the command line. For example:

```bash 
fmusic "beatles"
```

## License

This project is licensed under the GNU General Public License v3.0, see
[LICENSE](LICENSE).
