FROM ruby:3.4-bookworm
WORKDIR /app
ENV BUNDLE_DEPLOYMENT=0
COPY Gemfile ./
RUN bundle install
COPY . .
RUN chmod +x /app/bin/boot /app/bin/rails
CMD ["/app/bin/boot"]
