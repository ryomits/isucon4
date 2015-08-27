# ISUCON4

isucon4の参考解答(resis)を参考にnginx + unicorn + WAFなしでHello World

```
git clone git@github.com:ryomits/isucon4.git
```

## nginx
```
sudo yum install nginx
sudo cp isucon4/nginx.conf /etc/nginx
sudo service nginx start
```

## アプリケーション
```
cd isucon4/ruby
mkdir log
bundle install --path vendor/bundle
bundle exec foreman start unicorn
```

### foreman
unicornを上げるためにformanというGemを使用しています。
アプリケーションを上げるために複数のプロセスを上げる必要があったりしますよね。
(unicorn、非同期処理のためのworkerなど)
formanはそれらをまとめて管理できます。
Procfileにunicornやworkerの起動方法を記述しておき、foreman startするとまとめてあがります。
isuconでは不要かと思いますがforman startをsupervisorなんかの死活監視ツールで監視するみたいです。

Procfile
```
unicorn: bundle exec unicorn -c unicorn_config.rb
```
