FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /Yalla-Notlob
WORKDIR /Yalla-Notlob

ADD Gemfile /Yalla-Notlob/Gemfile
ADD Gemfile.lock /Yalla-Notlob/Gemfile.lock 

RUN yes | apt install npm
RUN npm install --global yarn
RUN yarn add bootstrap@next 
RUN yarn add popper.js
RUN yarn add @popperjs/core
RUN bundle install
ADD . /Yalla-Notlob