# docker-static

## ネットワーク作成
```
$ docker network create --driver bridge back-static
```

## .envファイル設置・編集
```
# sampleをコピーして編集
$ cp .env-sample .env
```

## ボリューム作成
`SFTP_USER_NAME`は、`.env`に書いた値

```
$ docker volume create --name=SFTP_USER_NAME-static-data
```

## Apacheの設定ファイル編集
```
# sampleをコピーして編集
$ cd setting/apache2/conf.d
$ cp my_setting-sample.conf my_setting.conf
```

## 公開鍵の設置
* 事前にローカルで`docker_static_rsa`、`docker_static_rsa.pub`を作成しておく
* SCPとかで`./ssh`に`docker_static_rsa.pub`を設置する
* ローカルからSFTPでログインする際に秘密鍵として`docker_static_rsa`を使用する

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
