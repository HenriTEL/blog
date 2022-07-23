FROM henritel/git-blog AS builder
RUN git-blog https://github.com/HenriTEL/blog.git

FROM nginx:alpine
COPY media /usr/share/nginx/html/media/
COPY --from=builder /out/blog/ /usr/share/nginx/html
