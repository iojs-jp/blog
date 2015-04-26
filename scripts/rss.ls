require! {
  fs: {writeFileSync}
  rss: RSS
  season: {readFileSync}
  lodash: _
}

rss = new RSS do
  title: 'iojs.jp blog'
  description: 'io.js 日本語ローカリゼーション'
  feed_url: \http://blog.iojs.jp/feed.xml
  site_url: \http://blog.iojs.jp
  image_url: \http://blog.iojs.jp/logo.png
  updated: new Date!

metadata = readFileSync \./src/metadata.cson
metalist = Object.keys metadata .map (key)->
  _.extend do
    metadata[key]
    id: key
metalist.sort (x, y)-> new Date(y.pubDate) - new Date(x.pubDate)
for item in metalist.slice 0, 20
  rss.item do
    title: item.title
    description: item.description
    url: "http://blog.iojs.jp/#{item.id}.html"
    date: new Date item.pubDate

writeFileSync \./build/feed.xml, rss.xml!
