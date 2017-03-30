windows-cloud-devtools
=======================

A powershell container with various cloud development tools pre-installed.

- chocolately
- curl
- node
- python
- aws-cli
- terraform

### usage
```
docker run -it --rm -v $env:USERPROFILE\.aws:c:\users\containeradministrator\.aws -v c:\code:c:\code jritsema/windows-cloud-devtools
```