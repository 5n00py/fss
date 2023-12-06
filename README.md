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
  alternative to `find`. **Important Note:**: On certain Linux distributions,
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
