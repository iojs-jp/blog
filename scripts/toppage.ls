require! {
  fs: {writeFileSync}
  season: {readFileSync}
  jade: {compileFile}
  lodash: _
}

index = readFileSync \./src/index.cson
metadata = readFileSync \./src/metadata.cson

data =
  headline: _.extend do
    metadata[index.headline]
    id: index.headline
  contents: index.contents.map (key)-> _.extend do
    metadata[key]
    id: key

html = compileFile \./src/index.jade <| data
writeFileSync \./build/index.html, html
