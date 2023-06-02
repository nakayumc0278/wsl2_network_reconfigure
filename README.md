# wsl2_network_reconfigure

# 概要
このバッチファイルは、WSL2を起動後に Pulse Secureで接続すると
Windowsのルーティングテーブルがうまく書き換えが行われずWSL2から
インターネット(VPN接続先を含む)に出られなくなることがあります。
それをこのスクリプトで強制的に書き換えることで、Pulse Secure接続後でも
インターネットに出られるようにするバッチファイルです。

# ディレクトリの構造

```
wsl2_network
├── file
│   ├── wsl2_network_reconfigure.bat  # PowerShellを呼び出すバッチファイル
│   └── wsl2_network_reconfigure.ps1  # Windowsのルーティングを書き換えるスクリプト
└── wsl2_network_reconfigure.bat.lnk   # バッチファイルを管理者権限で呼び出すショートカットファイル
```

# 使い方
## 1．コマンドプロンプトを起動し、インターフェースの状況を確認

「`netsh interface show interface`」を実行して、Pulse Secure っぽいIFを見つけて、インターフェース名をコピーする。


## 2．wsl2_network_reconfigure.ps1 の変更 (必ず文字コードはANSIで保存してください)

メモ帳などでwsl2_network_reconfigure.ps1を開き、下記の部分を変更する。

`$vpn = Get-NetIPInterface -InterfaceAlias "イーサネット 2" -AddressFamily IPv4`  

　　　　　　　　　　　　　　　　　　　　　　　      ↑の部分を1. でコピーしたインターフェース名に変更する

## 3．batファイルのショートカットを実行する。(管理者権限で実行するため)

以降、Pulse Secure が切れたら再度このバッチファイルを実行してください。
