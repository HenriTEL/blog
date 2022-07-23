FROM henritel/git-blog:v0.1 AS builder

COPY . /blog
RUN /bin/git-blog

FROM nginx:1.23-alpine
COPY media /usr/share/nginx/html/media/
COPY --from=builder /out/blog/ /usr/share/nginx/html
