# Zellij themes agregators

An aggregator of various zellij themes. 

## How to build ? 

Clone this repository and run the command below, it will fetch all the themes in their latest version (using the default branch of their repo). The themes can be found in the `build/` folder after running the command.

```sh
make
```

If you want to download the themes directly you can download the latest artifact from the CI run on master.

## How to install themes ? 

Zellij will recognised all themes defined in a directory `themes` inside it's config folder.

Usually it means you have to copy the themes in the `build/` folder to `~/.config/zellij/themes/`.

The docs of zellij regarding themes is here: https://zellij.dev/documentation/themes#getting-zellij-to-pick-up-the-theme . 


