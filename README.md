# dncngrl-static

## ネットワーク作成
```
$ docker network create --driver bridge back-dncngrl-static
```

## ボリューム作成
```
$ docker volume create --name=dncngrl-static-data
```

## .envファイル設置
```
# sampleをコピーして編集
$ cp .env-sample .env
```

## 公開鍵の設置
* 事前にローカルで`dncngrl_static_rsa`、`dncngrl_static_rsa.pub`を作成しておく
* SCPとかで`./ssh`に`dncngrl_static_rsa.pub`を設置する
* ローカルからSFTPでログインする際に秘密鍵として`dncngrl_static_rsa`を使用する

## データのバックアップ/リストア
```
# バックアップ
$ sh script/backup.sh

# リストア
# あらかじめbackup以下にdata.tarを置いておく
$ sh script/restore.sh
```

## コンテナの中に入る
`service_name`は`httpd`とか`data`とか。`container_name`ではないので注意

```
$ docker-compose run --rm service_name /bin/sh
```
