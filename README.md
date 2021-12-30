# vscode-dev-containers-templates
VS Code development containers templates, taken from [vscode-dev-containers](https://github.com/microsoft/vscode-dev-containers) and customized to run with Podman [vs-code-remote-containers-podman](https://opensource.com/article/21/7/vs-code-remote-containers-podman).

Prerequisites:

1. Installed [VSCode](https://code.visualstudio.com/) version 1.63.1
2. Installed [devcontainer-cli](https://code.visualstudio.com/docs/remote/devcontainer-cli)
3. `devcontainer-cli` is on the `$PATH` or add to `~/.local/bin`
    
    ```
    cd ~/.local/bin
    ln -s ~/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin/devcontainer devcontainer
    ```