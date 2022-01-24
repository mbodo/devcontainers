# vscode-dev-containers-templates
VS Code development containers templates, taken from [vscode-dev-containers](https://github.com/microsoft/vscode-dev-containers) and customized to run with Podman [vs-code-remote-containers-podman](https://opensource.com/article/21/7/vs-code-remote-containers-podman).

Prerequisites:

1. Installed [VSCode](https://code.visualstudio.com/) version >= 1.63
2. Installed [devcontainer-cli](https://code.visualstudio.com/docs/remote/devcontainer-cli)
3. `devcontainer-cli` is on the `$PATH` or add to `~/.local/bin`
    
    ```
    cd ~/.local/bin
    ln -s ~/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin/devcontainer devcontainer
    ```
4. Installed `make` >= 4.2.1

   RHEL8/Fedora:

   ```
   sudo dnf install make
   ```

Create New Project:

1. ```git clone https://github.com/mbodo/vscode-dev-containers-templates.git```
2. ```cd vscode-dev-containers-templates```
3. Execute
    ```
    make PROJECT=<Project Name> \
    TYPE=container-templates/<TYPE> \
    OS=container-templates/<TYPE>/<OS>
    ```
    Example:
    ```
    make PROJECT=myproject \
    TYPE=go \
    OS=debian
    ```
    Output:
    ```
    ▶ Executing initial setup of project: myproject

    mkdir -p /home/fedora/git/mbodo/vscode-dev-containers-templates/../myproject

    cp -R /home/fedora/git/mbodo/vscode-dev-containers-templates/container-templates/go/debian/.build /home/fedora/git/mbodo/vscode-dev-containers-templates/../myproject

    chmod 0744 -R /home/fedora/git/mbodo/vscode-dev-containers-templates/../myproject/
    ```


