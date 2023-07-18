# wsl2_network_reconfigure

# 概要
WSL2を起動後に Pulse SecureでVPNを接続すると、Windowsのルーティングテーブルが書き換えが行われず
WSL2からインターネット(VPN接続先を含む)に出られなくなることがあります。
そのため、このバッチファイルを使用してWindowsのルーティングテーブルを強制的に書き換えることで、
Pulse Secure接続後でもインターネットに出られるようにするものです。

# ディレクトリの構造

```
wsl2_network
├── file
│   ├── wsl2_network_reconfigure.bat  # PowerShellを呼び出すバッチファイル
│   └── wsl2_network_reconfigure.ps1  # Windowsのルーティングを書き換えるPowerShellスクリプト
└── wsl2_network_reconfigure.bat.lnk  # バッチファイルを管理者権限で呼び出すショートカットファイル
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
