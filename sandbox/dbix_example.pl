use strict;
use Kutter::Schema;
use Kutter::Web;
use DateTime;

# 接続情報を Kutter::Web のAPIから拝借
my $connect_info = Kutter::Web->config->{connect_info};
# 接続
my $schema = Kutter::Schema->connect( @{$connect_info} );
# tweetテーブルから全件取得
my $tweets = $schema->resultset('Tweet')->search();
# resultsetをイテレータで回す
while ( my $tweet = $tweets->next ){
    print $tweet->body . "\n";
}

# 条件にマッチするものが無かったらinsert、あったら取得
my $new_tweet = $tweets->find_or_create(
    {
        id         => 12345,
        body       => 'hogehoge',
        user_name  => 'yusukebe',
        created_on => DateTime->new(
            year      => 2009,
            month     => 10,
            day       => 12,
            time_zone => 'Asia/Tokyo'
        ),
    }
);

# 更新
$new_tweet->body('mogemoge');
$new_tweet->update();

