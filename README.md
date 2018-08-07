# Continutiy

Not entirely sure what this is going to be yet...

* System dependencies

Redis

To have launchd start redis now and restart at login:
  brew services start redis
Or, if you don't want/need a background service you can just run:
  redis-server /usr/local/etc/redis.conf

* Configuration

Can be started with Foreman start in the root directory if redis is setup and running on 

Otherwise 'rails s' will run with limited functionality

* Database creation

rails db:migrate will setup a local sqlite db for development 

This project was started using the 'Jumpstart' Rails project setup. 
https://github.com/kylerdanielster/jumpstart Forked from gorails.


* Ruby version 2.4 
* Rails version 5.2


