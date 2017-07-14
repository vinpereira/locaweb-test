FROM ruby:2.4.1

ENV CODECLIMATE_REPO_TOKEN=cd36c8ec4582c5043105100f9078e452ba37f098142d0e8f63087ea417646338

COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bundle install

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter && chmod +x ./cc-test-reporter

EXPOSE 9292
CMD ["puma"]