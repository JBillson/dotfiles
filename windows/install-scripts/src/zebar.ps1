Invoke-WebRequest -uri https://github.com/glzr-io/zebar/releases/latest/download/Zebar_x64_v1.3.0.msi -method GET -OutFile ../../zebar/zebar-installer.msi

../../zebar/zebar-installer.msi /quiet
