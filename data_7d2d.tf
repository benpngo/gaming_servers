# Config templates
data "template_file" "seven" {
  vars = {
    serverconfig = base64encode(file("${path.module}/files/serverconfig.xml"))
    serveradmin  = base64encode(file("${path.module}/files/serveradmin.xml"))
    username     = "steam"
  }

  template = <<EOF
#cloud-config
package_upgrade: true
packages:
  - mesa-libGLU
  - libXcursor.x86_64
  - libXrandr
  - glibc.i686
  - libstdc++.i686
  - libstdc++48.i686
  - wget
groups:
  - steam
users:
  - default
  - name: $${username}
    homedir: /opt/games
    primary_group: steam
    lock_passwd: False
write_files:
  - path: /tmp/serverconfig.xml
    owner: steam:steam
    content: "$${serverconfig}"
    encoding: b64
    permissions: '0755'
  - path: /tmp/serveradmin.xml
    owner: steam:steam
    content: "$${serveradmin}"
    encoding: b64
    permissions: '0755'
runcmd:
  - [ "/bin/bash", "-c", "sudo mkdir /opt/games/{bin,steamcmd}" ]
  - [ "/bin/bash", "-c", "sudo wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -P /opt/games/steamcmd" ]
  - [ "/bin/bash", "-c", "sudo tar -xzvf /opt/games/steamcmd/steamcmd_linux.tar.gz -C /opt/games/steamcmd && rm -rf /opt/games/steamcmd/steamcmd_linux.tar.gz" ]
  - [ "/bin/bash", "-c", "sudo chown -R steam:steam /opt/games" ]
  - [ "/bin/bash", "-c", "sudo -u steam /opt/games/steamcmd/steamcmd.sh +force_install_dir /opt/games/7days +login anonymous +app_update 294420 +exit" ]
  - [ "/bin/bash", "-c", "sudo -u steam mkdir /opt/games/7days/Mods" ]
EOF
}
