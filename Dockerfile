FROM ruby:3.1.4
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /MCC
# コンテナ内にmyappディレクトリを作成

WORKDIR /MCC
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /MCC/Gemfile
COPY Gemfile.lock /MCC/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /MCC
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー