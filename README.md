<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/113856355-68e06f80-97a1-11eb-9117-3a882d0b64c5.png" draggable="false" ondragstart="return false;" alt="gitio Title" title="gitio" /></a></p>

Git URLs can get pretty long since we might have long names for repositories
and files. A long URL will look messy, sometimes difficult to read. Short URLs
look better, especially when we need to share them on emails and socials. To
hand over this problem, this plugin—inspired by a service provided by GitHub
([Git.io][gitio])—shorten URLs using curl.
<br/><br/>

## Getting Started

Download the repository via curl:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolodiamante/gitio/HEAD/bootstrap.sh)"
```

Alternatively, clone manually:

```shell
git clone https://github.com/nicolodiamante/gitio.git ~
```

Head over into the directory and then:

```shell
cd utils && source install.sh
```

The script will look for the `zshrc` and then append the full path to the
`gitio/script` directory to the `fpath`:

```shell
fpath=(~/gitio/script $fpath)
autoload -Uz gitio
```

### Install via [Oh My Zsh][ohmyzsh]

```shell
git clone https://github.com/nicolodiamante/gitio.git $ZSH_CUSTOM/plugins/gitio
```

- Add to your `zshrc` plugins array `plugins=(... gitio)`
- Restart the shell to activate
<br/><br/>

## How to Use `gitio`

- `gitio`: inside a git repository, it will search for the URL within the config
file inside the `.git` directory.

- `gitio [URL]`: shortens the URL but without a vanity name given there is no
control of the output.

- `gitio [URL] [vanity-name]`: shortens and changes the URL with the vanity name
given. Instead of typing the entire URL you can type only the `username/repo`.

- `gitio --retrieve [URL]`: retrieves the original URL from the shortened URL.

- `gitio --open [URL]`: opens the URL in the default browser (works only with
GitHub URLs).

For full gitio options, see `gitio --help`.
<br/><br/>

## Notes

### Resources

- [The GitHub Blog][git-blog]

### Contribution

Please report any issues or bugs to the [issues page][issues]. Suggestions for
improvements are welcome!<br/><br/>

<p align="center"><a href="#"><img src="https://user-images.githubusercontent.com/48920263/113406768-5a164900-93ac-11eb-94a7-09377a52bf53.png" draggable="false" ondragstart="return false;" /></a></p>

<p align="center"><a href="https://nicolodiamante.com" target="_blank"><img src="https://user-images.githubusercontent.com/48920263/113433823-31a84200-93e0-11eb-9ffb-9111b389ef2f.png" draggable="false" ondragstart="return false;" alt="Nicol&#242; Diamante Portfolio" title="Nicol&#242; Diamante" width="11px" /></a></p>

<p align="center"><a href="https://github.com/nicolodiamante/gitio/blob/main/LICENSE.md" target="_blank"><img src="https://user-images.githubusercontent.com/48920263/110947109-06ca5100-8340-11eb-99cf-8d245044b8a3.png" draggable="false" ondragstart="return false;" alt="The MIT License" title="The MIT License (MIT)" width="90px" /></a></p>

<!-- Link labels: -->
[gitio]: https://git.io
[ohmyzsh]: https://github.com/robbyrussell/oh-my-zsh/
[git-blog]: https://github.blog/2011-11-10-git-io-github-url-shortener/
[issues]: https://github.com/nicolodiamante/gitio/issues
