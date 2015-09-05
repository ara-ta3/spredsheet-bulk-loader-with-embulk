FROM tarata/centos6-with-embulk
MAINTAINER Arata Tanaka <tarata43@yahoo.co.jp>
WORKDIR /tmp
ENV GEM_PATH /usr/local/rvm/gems/ruby-2.2.2:/usr/local/rvm/gems/ruby-2.2.2@global
ENV GEM_HOME /usr/local/rvm/gems/ruby-2.2.2
ENV PATH $PATH:/usr/local/rvm/rubies/ruby-2.2.2/bin:/usr/local/rvm/gems/ruby-2.2.2/bin
RUN git clone https://github.com/kataring/embulk-input-google-spreadsheets.git /usr/local/src/embulk-input-google-spreadsheets
RUN gem build /usr/local/src/embulk-input-google-spreadsheets/embulk-input-google-spreadsheets.gemspec
RUN embulk gem install /tmp/embulk-input-google-spreadsheets-0.0.1.gem
RUN git clone https://github.com/kataring/embulk-output-google-spreadsheets.git /usr/local/src/embulk-output-google-spreadsheets
RUN gem build /usr/local/src/embulk-output-google-spreadsheets/embulk-output-google-spreadsheets.gemspec
RUN embulk gem install /tmp/embulk-output-google-spreadsheets-0.0.1.gem
