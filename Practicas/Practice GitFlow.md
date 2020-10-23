# Practice Git Flow

Link Github  “pratica_git_flow”
https://github.com/SalmaFabel/pratica_git_flow.git

#### Github account
>For this practice, the Github account is created, but it was already created.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/cuentaGithub.PNG)

#### SSH key

>The ssh key is configured in github so that we do not always have to put our username and password, for this the following steps were carried out:

>3 putty tools are downloaded. "Puttygen" is executed to generate the private key, the tools are downloaded from the following page: 
https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/HerramientasPutty.PNG)

>Where it says "puttygen" is selected, to generate the private key and the following appears:

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/Putty%20key%20generator.PNG)

>The key is generated and a password is written for it, with which the key can be consulted later. The password is saved.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/Putty%20Key.PNG)

>The tools are saved in a folder inside the startup, it is added in the variables of the system environment with the reference of the tool "plink.exe".

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/VariablesEntorno.PNG)

>In the github account, in configurations, we go where it says SSH key the public key is pasted.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/GithubSSH.PNG)

>Once it is saved, it is displayed in our github as follows:

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/SSHvisualizacion.PNG)

>To finish with the ssh configuration you enter "git Bash" and enter your username and password. Then you clone the repository and it no longer asks for the data.

```
salmi@HENSF2 MINGW64 /c/Program Files/PuTTY
$ git config --global user.name "Salma Fabel"

salmi@HENSF2 MINGW64 /c/Program Files/PuTTY
$ git config --global user.email salma.hernandez16@tectijuana.edu.mx

salmi@HENSF2 MINGW64 /c/Program Files/PuTTY
$ plink.exe -v git@github.com
Looking up host "github.com" for SSH connection
Connecting to 140.82.113.4 port 22
We claim version: SSH-2.0-PuTTY_Release_0.74
Remote version: SSH-2.0-babeld-c2abfebf
Using SSH protocol version 2

```

>As proof that it was done correctly, if we go to github where the ssh key is, we can see that it appears that we use it.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/UsoSSH.PNG)

#### Creation of the repository "pratica_git_flow"

>In this part of the practice the repository is created.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/RepositorioGitflow.PNG)

#### Clone repository on PC

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub
$ git clone git@github.com:SalmaFabel/pratica_git_flow.git
Cloning into 'practica_git_flow'...

```

>Viewing the cloned repository.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/ClonarRepositorio.PNG)

#### Development branch

>Once we have the cloned repository, what follows is to create the branches with "git branch" we can know in which branch we are, in this case it is the "master" that is by default.

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (master)
$ git branch
*master

```

>The following command is used to create the "development" branch

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (master)
$ git checkout -b development

```

>README.md is modified

#### Commit on the development branch

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (development)
$ ls
README.md

salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (development)
$ git add -A

salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (development)
$ git status
On branch development
Changes to be committed:
  (use "git  restore --staged <file>..." to unstage)
            modified:    README.md


salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (development)
$ git commit -m "rama development"

```

>Push in the development branch

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (development)
$ git push --set-upstream origin development

```

>Viewing the development branch modification

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/RamaDevelopment.PNG)

#### Branch features

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (development)
$ git checkout -b features
Switched to a new branch 'features'

```

>Commit on the features branch

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (features)
$ git status
On branch features
Changes to be committed:
  (use "git  restore --staged <file>..." to unstage)
            modified:    README.md
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (features)
$ git commit -m "rama features"

```

>Push on the features branch

```
salmi@HENSF2 MINGW64 ~/OneDrive/Documentos/GitHub/pratica_git_flow (features)
$ git push --set-upstream origin features

```

>Viewing the modification of the features branch.

![ScreenShot](https://github.com/SalmaFabel/IMG/blob/main/RamaFeatures.PNG)

