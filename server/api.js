const express = require('express');

const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');

const MESSAGES = require('./messages');

const EMAIL = 'user@mailforever.com';
const PASSWORD = '123';

const TOKEN = 'mailforeverjwt'

const PORT = process.env.PORT || '3009';

const PREFIX = '/api/'

app.use(morgan('tiny'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, token');

  next();
});

app.get('/', (req, res) => {
  res.status(200).send('MailForever Api');
});

app.get(`${PREFIX}inbox`, (req, res) => {
  // if (req.body.email === EMAIL && req.body.password === PASSWORD) {
    return res.status(200).send({
      status: 'ok',
      messages: MESSAGES,
    });
  // }

  // return res.status(401).send({
  //   status: 'error',
  //   message: 'Invalid user and/or password ',
  // });
});

app.get('/messages', (req, res) => {
  if (req.headers.token === TOKEN) {
    return res.status(200).send({
      status: 'ok',
      recipes: MESSAGES,
    });
  }

  return res.status(403).send({
    status: 'error',
    message: 'User not authenticated',
  });
});

app.listen(PORT, 'localhost', (err) => {
  if (err) {
    console.log(err);
  }

  console.info(`The Magic Happens on port ${PORT}`);
});
