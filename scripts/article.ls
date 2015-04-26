require! {
  fs
  season
  jade: {compileFile}
  \markdown-it : MarkdownIt
}

md = new MarkdownIt do
  html: true
  linkify: true

metadata = season.readFileSync \./src/metadata.cson
Object.keys metadata
  .forEach (key)->
    article = fs.readFileSync "./articles/weekly/#{key}.md" .toString!
    data =
      title: metadata[key].title
      description: metadata[key].description
      name: key
      body: md.render article
    html = compileFile \./src/page.jade <| data
    fs.writeFileSync "./build/#{key}.html", html
