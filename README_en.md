# MTTruncateURL Plugin

A plugin for rewriting cannonical URLs with relative URLs.

MTTruncateURL Plugin which provides a container tag to simply rewrite cannonical URLs with relative URLs.

## Changes

 * 0.01(2004.09.29)
   * First Release.

## Overview

Lots of built-in MT tags, such as MTEntryPermalink or MTArchiveLink, always generate canonical URLs (e.g. http://www.domain.tld/blog/index.html).  It is sometimes inconvenient because generated HTML files grow large and make hard to distinguish between internal links and external links.  MTTruncateURL Plugin allows you to simply replace cannonical URLs with relative URLs.

## Tags

### MTTruncateURL

MTTruncateURL is a container tag that converts its contents (more precisely saying, all of "href", "src", and "action" attributes) into relative URLs if possible. The converted URLs will be relative to the blog server, such as "/blog/index.html" and "/blog/archives/photo/index.php".

For example, in the index template, this container tag allows you to convert one single MTEntryPermalink tag to a relative, and to convert a whole document as well.

Example:

    <MTTruncateURL>
      <MTEntries lastn="10">
        ...
      </MTEntries>
    </MTTruncateURL>

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html]().

## Author & Copyright

Copyright 2004, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
