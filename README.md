# MTTruncateURLプラグイン

Canonical URLを相対URLに変換するプラグイン。

## 更新履歴

 * 0.01(2004.09.29):
   * First Release

## 概要

MTEntryPermalinkやMTArchiveLinkを始めとして多くのMTタグがcanonical URL(例: http://www.domain.tld/blog/index.html)を生成します。したがって、生成されるHTMLファイルのサイズは肥大化したり、内部リンクと外部リンクの区別が難しくなったりしがちで不便なこともあります。MTTruncateURL Pluginを使うと、canonical URLを相対URLに簡単に置き換えることができます。

## 追加されるタグ

### MTTruncateURLコンテナ

可能であれば中身(正確には、中身に含まれるすべてのhref, src, action属性)を相対URLに変換するコンテナタグ。変換後のURLはサーバーのURLに対する相対パスとなります(例: /blog/index.html, /mt/mt-comments.cgi?entry_id=XXX)。

インデックステンプレートの中で使えば、特定のMTEntryPermalinkタグを相対URLに変換することもできますし、テンプレートの最初に<MTTruncateURL>、最後に</MTTruncateURL>と追加することで文書全体を相対URL化することもできます。

## 補足説明

類似のプラグインとして[MT Extensions: MTRelativeURL 1.0](http://www.nonplus.net/software/mt/MTRelativeURL.htm)があります。こちらはBaseURLを指定してそのURLからの相対URLを生成する機能がありますが、コンバートする対象のMTタグをいちいち<MTRelativeURL></MTRelativeURL>で囲む必要があります。

MTTruncateURLは囲んだ領域にある任意の要素のhref, src, action属性に指定されているすべてのURLを相対URLに変換します。したがって対象はMTタグに限られることなく、エントリ中に含まれるURLも変換できます。また、変換による副作用が気になるかもしれませんが、例えば、

    <a href="http://as-is.net/blog/" title="http://as-is.net/blog/">http://as-is.net/blog/</a>

というコード片は、以下のように変換されるだけです。Accessibilityが阻害されることは(今のところ私の気が付いている限りでは)ありません。

    <a href="/blog/" title="http://as-is.net/blog/">http://as-is.net/blog/</a>

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2004, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
