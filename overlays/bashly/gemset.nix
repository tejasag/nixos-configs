{
  bashly = {
    dependencies = ["colsole" "completely" "mister_bin" "requires"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0mfvmfgb7rfjaknq68c7bzr788y9ly212mphi554b9jnc0a8lsam";
      type = "gem";
    };
    version = "0.6.8";
  };
  colsole = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d2y4wgflrjjfiqz8zh7saapxhx01bxn4lj1197mkvvf10cz6k2i";
      type = "gem";
    };
    version = "0.7.2";
  };
  completely = {
    dependencies = ["colsole" "mister_bin"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0918x4gnfz8nszyvqn8zgwnhizkdzj0kz2zx86i5igkc86lsp8j8";
      type = "gem";
    };
    version = "0.2.0";
  };
  docopt = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rvlfbb7kzyagncm4zdpcjwrh682zamgf5rcf5qmj0bd6znkgy3k";
      type = "gem";
    };
    version = "0.6.1";
  };
  mister_bin = {
    dependencies = ["colsole" "docopt"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qd1jvk358z755kbnc7m8ajza2xcdmwk5r540400fanbn7fgrfqc";
      type = "gem";
    };
    version = "0.7.1";
  };
  requires = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "147p6vibgsgixqhdbjjiz2jpsjy8526ljg3a46xqlr2480lvziha";
      type = "gem";
    };
    version = "0.2.0";
  };
}
