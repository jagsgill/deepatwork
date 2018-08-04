FROM alpine:3.8 AS fetcher
ARG TAR_PATH
ADD https://github.com/gohugoio/hugo/releases/download/v0.45.1/hugo_0.45.1_Linux-64bit.tar.gz ${TAR_PATH}/hugo.tar.gz
RUN tar -xvzf ${TAR_PATH}/hugo.tar.gz -C ${TAR_PATH}

FROM alpine:3.8
ARG TAR_PATH
ARG HUGO_PATH
ENV SITE=deep-at-work
COPY --from=fetcher ${TAR_PATH}/hugo ${HUGO_PATH}/hugo
COPY entrypoint.sh /opt/deep-at-work/entrypoint.sh
RUN chmod 755 /opt/deep-at-work/entrypoint.sh
ENV PATH=${HUGO_PATH}:${PATH}
ENV SITE_PATH=/opt/${SITE}
RUN apk add git
WORKDIR /deep-at-work-site/deep-at-work-base/
RUN git init
RUN git submodule add https://github.com/gundamew/hugo-bingo.git themes/hugo-bingo
RUN echo 'theme = "hugo-bingo"' >> config.toml
RUN sh -c "if [ ! -d /deep-at-work-site/deep-at-work-base ]; then hugo new site /deep-at-work-site/deep-at-work-base; fi"
RUN ls themes
RUN sh -c "if [ ! -d /deep-at-work-site/deep-at-work-base/static ]; then cp -r ./themes/hugo-bingo/static/ .; fi"
ENTRYPOINT "${SITE_PATH}/entrypoint.sh"

