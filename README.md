<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/gitio/assets/48920263/c79c27f6-6cb5-4e59-87cc-b2e48f17e6e1" draggable="false" ondragstart="return false;" alt="gitio" title="gitio" />
    <img src="https://github.com/nicolodiamante/gitio/assets/48920263/d170b145-00de-4aa9-a812-a108ab6335b7" draggable="false" ondragstart="return false; "alt="gitio" title="gitio" />
  </picture>
</p>

Git URLs can become cumbersome due to the long file names, leading to lengthy and often messy URLs that can be difficult to read. This can be particularly problematic when sharing URLs via email or social media. To address this issue, this plugin has been developed to use curl to shorten URLs, inspired by a similar service offered by GitHub called [Git.io][gitio]. The use of shortened URLs can not only improve readability but also make sharing URLs more convenient and efficient. This plugin allows users to enjoy the benefits of short and catchy Git URLs.
<br><br>

> Note: This script utilises [Git.io][gitio] for URL shortening. Please be advised that as of January 2022, Git.io is has announced that it is no longer accepting new links for shortening. Existing shortened links will remain operational.

<br>

## Getting Started

Download the repository via curl:

```shell
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolodiamante/gitio/HEAD/bootstrap.zsh)"
```

Alternatively, you can clone the repository manually:

```shell
git clone https://github.com/nicolodiamante/gitio.git ~/gitio
```

Once you have downloaded the repository, navigate to the root directory of the repository, and then execute the installation script using the following command:

```shell
source utils/install.sh
```

The script is designed to search for the zshrc file and append the complete path to the gitio/script directory to the fpath variable. By doing this, the script ensures that the script directory is added to the list of paths that Zsh searches for when looking for executable scripts.

```shell
fpath=(~/gitio/script $fpath)
autoload -Uz gitio
```

<br>

### Install via [Oh My Zsh][ohmyzsh]

```shell
git clone https://github.com/nicolodiamante/gitio.git $ZSH_CUSTOM/plugins/gitio
```

- Add to your zshrc plugins array `plugins=(... gitio)`
- Restart the shell to activate
  <br><br>

## How to use gitio

- `gitio` when lanced into a Git repository, the plugin will look for the URL in the config file located in the .git directory.

- `gitio [URL]` shortens the URL but does not provide a vanity name for the shortened URL, resulting in no control over the output.

- `gitio [URL] [vanity-name]` it allows users to provide a vanity name for the shortened URL. In a Git repository instead of having to type out the entire URL, users can simply enter the username/repo and the plugin will handle the rest.

- `gitio --retrieve [URL]` fetch the full URL from the abbreviated URL.

- `gitio --open [URL]` designed to exclusively function with GitHub URLs, will automatically launch the default browser to access the shortened URL.

For full gitio options, see `gitio --help`.
<br><br>

## Notes

### Resources

- [The GitHub Blog][git-blog]

### Contribution

Any suggestions or feedback you may have for improvement are welcome. If you encounter any issues or bugs, please report them to the [issues page][issues].
<br><br>

<p align="center">
  <picture>
    <img src="https://github.com/nicolodiamante/gitio/assets/48920263/c9f2c99f-3541-4cf8-9c79-54497c71881e" draggable="false" ondragstart="return false;" /></>
  </picture>
</p>

<p align="center">
  <a href="https://nicolodiamante.com" target="_blank">
    <img src="https://github.com/nicolodiamante/gitio/assets/48920263/c83cf018-57af-4ef8-a99a-517425445425" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante Portfolio" title="Nicol&#242; Diamante" width="17px" />
  </a>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/nicolodiamante/gitio/assets/48920263/3c178be9-75f4-4647-b593-7c42f57dd09b" draggable="false" ondragstart="return false;" alt="MIT License" title="MIT License" />
    <img src="https://github.com/nicolodiamante/gitio/assets/48920263/c02dde9b-3635-4953-87e9-da2078e779a2" draggable="false" ondragstart="return false; "alt="MIT License" title="MIT License" width="95px" />
  </picture>
</p>

<!-- Link labels: -->

[gitio]: https://git.io
[ohmyzsh]: https://github.com/robbyrussell/oh-my-zsh/
[git-blog]: https://github.blog/2011-11-10-git-io-github-url-shortener/
[issues]: https://github.com/nicolodiamante/gitio/issues
