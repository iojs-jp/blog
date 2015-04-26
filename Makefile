DEST = ./build
LSC = ./node_modules/.bin/lsc
PORT = 3000

all: assets toppage article rss

before:
	@mkdir -p $(DEST)

clean:
	@rm -rf $(DEST)

assets: cname favicon stylus logo

cname: before
	@cp ./src/CNAME $(DEST)

favicon: before
	@cp -r ./src/favicons/* $(DEST)

stylus: before
	@./node_modules/.bin/stylus ./src/*.styl --out $(DEST) -c

logo: before
	@cp ./src/logo.png $(DEST)

serve: before
	@./node_modules/.bin/static -p $(PORT) $(DEST)

toppage: before
	@$(LSC) ./scripts/toppage.ls

article: before
	@$(LSC) ./scripts/article.ls

rss: before
	@$(LSC) ./scripts/rss.ls

.PHONY: before clean assets cname favicon stylus logo serve toppage article rss
