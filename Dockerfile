FROM henritel/git-blog AS builder
# The following command is used to invalidate cache when the repo gets updated
ADD https://api.github.com/repos/HenriTEL/blog/git/refs/heads/main version.json
RUN git-blog https://github.com/HenriTEL/blog.git

FROM nginx:alpine
COPY media /usr/share/nginx/html/media/
COPY --from=builder /out/blog/ /usr/share/nginx/html
