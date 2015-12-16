# Benvatar

A silly project for adding overlays to twitter accounts... in this case the [Ben Week](http://benweek.whiteoctober.co.uk) badge.

Can easily be adapted to change the image to fit your needs.

![screenshot](https://cloud.githubusercontent.com/assets/1238468/11827006/e10189c4-a380-11e5-81ec-6083069933c2.png)

## Installing

```
$ git clone git@github.com:adambutler/benvatar.git
$ cd benvatar
$ bundle install
$ rake db:create
$ rake db:migrate
$ cp .env.example .env
```

Modify the `.env` file with your [Twitter app settings](https://apps.twitter.com)

## Contributing

Contributions are welcome, please follow [GitHub Flow](https://guides.github.com/introduction/flow/index.html)
