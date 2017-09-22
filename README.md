<p align="center">
  <a href="http://sweetalert.js.org">
    <img alt="MailForever" src="https://user-images.githubusercontent.com/5286092/30724076-d12cdd6c-9f11-11e7-8e3c-d4c8da040c41.png">
  </a>
</p>

<p align="center">
  A better replacement for you mailbox!
</p>

## Try it out


1. Clone this repo
```bash
$ git clone https://github.com/weslley39/askCharlie
```

2. Install all dependencies (front/back)
```bash
$ cd web/
$ npm install
$ bower install

$ cd server/
$ npm install
```

3. Run the back-end mock server
```bash
$ cd server/
$ node api.js
```

4. Run the front-end server
```bash
$ cd web/
$ gulp server (for dev mode)
$ gulp serve:dist (for dist mode)
```

Then access [http://localhost:3000/](http://localhost:3000/)
Enjoy 😉


## Routes
- `/inbox` - List of all the emails/messages in you inbox
- `/sent` - List of all the emails/messages sent

## Tests
All the tests are the files with the `.spec` extension around the project. There is unit tests for the validators the controllers and directives

If you want to run the tests:
```bash
$ cd web/
$ gulp test
```

## Things I would add/modify/approach differently for a production-ready system
I opened issues in this repo, with the label `feature`
