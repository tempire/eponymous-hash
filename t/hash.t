use Test::More;

subtest default_name => sub {
  use Eponymous::Hash;

  my ($one, $two) = qw/ three four /;

  is_deeply {eponymous_hash($one, $two)} => {qw/ one three two four /}
};

subtest specified_name => sub {
  use Eponymous::Hash 'epy';

  my ($one, $two) = qw/ three four /;

  is_deeply {epy($one, $two)} => {qw/ one three two four /}
};

done_testing;
