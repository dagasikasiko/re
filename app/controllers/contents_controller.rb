class ContentsController < ApplicationController
  def top
    @rss1 = Rsses.all.order("time DESC").page(params[:page])
  end

  def watch1
  end

  def watch2
    require 'rss'

    @rss2 = RSS::Parser.parse "http://blog.livedoor.jp/rbkyn844/index.rdf"
  end

  def watch3
    @rss3 = Rsses.where("site_name is null ")
  end

  def new
    require 'rss'

    #暇つぶしニュース
    rss1 = RSS::Parser.parse "http://blog.livedoor.jp/rbkyn844/index.rdf"
    #ねたAtoZ
    rss2 = RSS::Parser.parse "http://netaatoz.jp/index.rdf"
    #しぃアンテナ(*ﾟーﾟ)
    # rss3 = RSS::Parser.parse "http://2ch-c.net/?xml_all"
    #コピペ情報局
    rss4 = RSS::Parser.parse "http://news.2chblog.jp/index.rdf"
    #ガジェットライフ速報
    rss5 = RSS::Parser.parse "http://gadgetlife2ch.blomaga.jp/index.rdf"
    #watch@2ちゃんねる
    rss6 = RSS::Parser.parse "http://www.watch2chan.com/index.rdf"
    # ガハろぐNewsヽ(･ω･)/ｽﾞｺｰ
    rss7 = RSS::Parser.parse "http://gahalog.2chblog.jp/index.rdf"
    # U-1速報
    rss8 = RSS::Parser.parse "http://u1sokuhou.ldblog.jp/index.rdf"
    # ぴろり速報２ちゃんねる
    rss9 = RSS::Parser.parse "http://pirori2ch.com/index.rdf"
    # ロン速
    rss10 = RSS::Parser.parse "http://ronsoku.com/index.rdf"
    # まとめたニュース
    rss11 = RSS::Parser.parse "http://matometanews.com/index.rdf"
    # SIerブログ
    rss12 = RSS::Parser.parse "http://sierblog.com/index.rdf"
    # あじあニュースまとめちゃんねる－韓国中国アジアニュース－
    rss13 = RSS::Parser.parse "http://asianews2ch.jp/index.rdf"
    # 2ろぐちゃんねる -2chまとめブログ
    rss14 = RSS::Parser.parse "http://2logch.com//index.rdf"
    # ニュー速クオリティ
    rss15 = RSS::Parser.parse "http://news4vip.livedoor.biz/index.rdf"
    # PCパーツまとめ
    rss16 = RSS::Parser.parse "http://blog.livedoor.jp/bluejay01-review/index.rdf"
    # FX2ちゃんねる
    rss17 = RSS::Parser.parse "http://www.fx2ch.net/feed"
    # 稼げるまとめ速報
    rss18 = RSS::Parser.parse "http://kasegeru.blog.jp/index.rdf"
    # 必殺自作人
    rss19 = RSS::Parser.parse "http://jisakunin.com/feed"




    make(rss1)
    make(rss2)
    # make(rss3)
    make(rss4)
    make(rss5)
    make(rss6)
    make(rss7)
    make(rss8)

    redirect_to root_path
  end

  def make(rss)
    rss.items.each do |entry|
      already = Rsses.where(:title => entry.title)
      if already.empty?
      rss = Rsses.new(:title => entry.title,:url => entry.link,:site_name => entry.dc_creator,:time => entry.dc_date,:click => 0)
      rss.save
      end
    end

    return
  end

end
