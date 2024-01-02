#!/bin/bash

vscode_default_directory="/opt/visual-studio-code"
if [ ! -d "$vscode_default_directory" ]; then
  git clone https://aur.archlinux.org/visual-studio-code-bin.git
  cd ./visual-studio-code-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf ./visual-studio-code-bin
fi

# move settings to vscode directory
cp ./settings.json ~/.config/Code/User

extensions=(
  7dp.webstorm-darcula-darker-theme
  aaron-bond.better-comments
  acarreiro.calculate
  alefragnani.project-manager
  amazonwebservices.aws-toolkit-vscode
  Angular.ng-template
  antfu.icons-carbon
  Arjun.swagger-viewer
  BeardedBear.beardedicons
  bmewburn.vscode-intelephense-client
  bradlc.vscode-tailwindcss
  chadalen.vscode-jetbrains-icon-theme
  christian-kohler.path-intellisense
  cweijan.onedark-modern
  dbaeumer.vscode-eslint
  dracula-theme.theme-dracula
  dunstontc.dark-plus-syntax
  eamodio.gitlens
  EdwinSulaiman.jetbrains-rider-dark-theme
  equinusocio.vsc-material-theme-icons
  foxundermoon.shell-format
  GitHub.github-vscode-theme
  golang.go
  guilhermerodz.omni-owl
  HarryHopkinson.vim-theme
  HasibX2000.dracula-pro
  humao.rest-client
  igornfaustino.emerald
  imekachi.webstorm-darcula
  johnpapa.Angular2
  johnpapa.vscode-peacock
  josee9988.minifyall
  JoseMurilloc.aura-spirit-dracula
  kisstkondoros.vscode-codemetrics
  leonardoleal202.dark-mono
  mattpocock.ts-error-translator
  meganrogge.template-string-converter
  MichaelZhou.fleet-theme
  miguelsolorio.fluent-icons
  miguelsolorio.min-theme
  miguelsolorio.symbols
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-vscode.live-server
  mvllow.rose-pine
  Natizyskunk.sftp
  naumovs.color-highlight
  nrwl.angular-console
  Obstinate.vesper-pp
  pflannery.vscode-versionlens
  philippetrosino.angular-component-file-switcher
  PKief.material-icon-theme
  pomber.git-file-history
  Prisma.prisma
  PROxZIMA.sweetdracula
  Qvist.jetbrains-new-ui-dark-theme
  rastikerdar.vscode-seedling-icon-theme
  raunofreiberg.vesper
  redhat.vscode-yaml
  ritwickdey.LiveServer
  rocketseat.theme-omni
  rokoroku.vscode-theme-darcula
  sdras.night-owl
  SimonSiefke.svg-preview
  SonarSource.sonarlint-vscode
  stivo.tailwind-fold
  streetsidesoftware.code-spell-checker
  streetsidesoftware.code-spell-checker-portuguese-brazilian
  tomoki1207.pdf
  usernamehw.errorlens
  vintharas.learn-vim
  VisualStudioExptTeam.intellicode-api-usage-examples
  VisualStudioExptTeam.vscodeintellicode
  vivaxy.vscode-conventional-commits
  vscode-icons-team.vscode-icons
  vscodevim.vim
  WakaTime.vscode-wakatime
  wart.ariake-dark
  whizkydee.material-palenight-theme
  WollaceBuarque.tailwind-theme
  xyz.local-history
  yasht.terminal-all-in-one
  yzhang.markdown-all-in-one
  ZainChen.json
  zguolee.tabler-icons
  zhuangtongfa.material-theme
)

for extension in ${extensions[@]}; do
  code --install-extension $extension
done