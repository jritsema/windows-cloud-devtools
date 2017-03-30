FROM microsoft/windowsservercore
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# install package manager
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

# install packages
RUN choco install curl --version 7.52.1 -y
RUN choco install git.install --version 2.12.2 -y
RUN choco install nodejs.install --version 7.8.0 -y
RUN choco install terraform --version 0.9.1 -y
RUN choco install python --version 3.6.1 -y

# install aws (chocolatey package doesn't work in container)
RUN pip install --upgrade --user awscli
RUN $env:PATH = '{0};{1}\AppData\Roaming\Python\Python36\Scripts' -f $env:PATH, $env:USERPROFILE ;\
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

# aliases
ADD profile.ps1 C:\\Windows\\System32\\WindowsPowerShell\\v1.0

ENTRYPOINT ["powershell"]
