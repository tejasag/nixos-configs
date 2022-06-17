{
  bashly = {
    dependencies = ["colsole" "completely" "mister_bin" "requires"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k37xsdjkj5g0749sypql471ihd98fih80qrv325ajxys9ymafry";
      type = "gem";
    };
    version = "0.7.9";
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
      sha256 = "09w57fh5b824ypwnwypp99qn2j5f9xpi6jny32yg7klbpyp7ajpj";
      type = "gem";
    };
    version = "0.3.1";
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
