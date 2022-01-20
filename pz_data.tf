# Config templates
data "template_file" "pz" {
  vars = {
    username = "steam"
  }

  template = <<EOF
#cloud-config
package_upgrade: true
packages:
  - mesa-libGLU
  - libXcursor.x86_64
  - libsdl2-2.0-0.i386
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
runcmd:
  - [ "/bin/bash", "-c", "sudo mkdir /opt/games/{bin,steamcmd}" ]
  - [ "/bin/bash", "-c", "sudo wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -P /opt/games/steamcmd" ]
  - [ "/bin/bash", "-c", "sudo tar -xzvf /opt/games/steamcmd/steamcmd_linux.tar.gz -C /opt/games/steamcmd && rm -rf /opt/games/steamcmd/steamcmd_linux.tar.gz" ]
  - [ "/bin/bash", "-c", "sudo chown -R steam:steam /opt/games" ]
  - [ "/bin/bash", "-c", "sudo -u steam /opt/games/steamcmd/steamcmd.sh +force_install_dir /opt/games/projectzomboid +login anonymous +app_update 380870 -beta b41multiplayer validate +exit" ]
EOF
}
