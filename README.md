# Git in Docker

System git too old? Run git from a docker container instead!

## Usage

First build the image.

```bash
$ bin/build
```

Then link `dgit` into your `$PATH`.

```bash
$ ln -s "${PWD}/dgit" ~/.local/bin/dgit
```

Use it like you would normal git!

```bash
$ dgit status
```
