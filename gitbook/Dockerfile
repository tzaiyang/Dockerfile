FROM node:10-alpine

# 不建议使用 3.2.3 之后的版本，官方为了收费反而阉割了不少功能
RUN npm install gitbook-cli -g \
 && gitbook fetch 3.2.3

WORKDIR /gitbook
COPY book.json book.json

# update mermaid version to 8.13.3
RUN gitbook install \
  && wget https://unpkg.com/mermaid@8.13.3/dist/mermaid.min.js -O \
     /gitbook/node_modules/gitbook-plugin-mermaid-gb3/dist/mermaid/mermaid.min.js \
  && wget https://unpkg.com/mermaid@8.13.3/dist/mermaid.min.js.map -O \
     /gitbook/node_modules/gitbook-plugin-mermaid-gb3/dist/mermaid/mermaid.min.js.map

ENTRYPOINT ["gitbook"]
