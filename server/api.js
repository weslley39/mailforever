const express           = require('express');
const app               = express();
const morgan            = require('morgan');
const bodyParser        = require('body-parser');
const MESSAGES_INBOX    = require('./messages-inbox.json');
const MESSAGES_SENT     = require('./messages-sent.json');

const PORT   = process.env.PORT || '3009';
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


// Messages INbox
app.get(`${PREFIX}inbox`, (req, res) => {
    return res.status(200).send({
      status: 'ok',
      messages: MESSAGES_INBOX,
    });
});

app.get(`${PREFIX}inbox/total-unread`, (req, res) => {
  let total = 0;

  MESSAGES_INBOX.forEach((message) => {
    if (message.read === false) {
      total = total + 1;
    }
  })

  return res.status(200).send({
    status: 'ok',
    total
  });
});

app.get(`${PREFIX}inbox/:id`, (req, res) => {
  const id             = req.params.id;
  let messageSelected  = {};

  MESSAGES_INBOX.forEach((message) => {
    if (message.uid === id) {
      messageSelected = message
    }
  })

  return res.status(200).send({
    status: 'ok',
    message: messageSelected
  });
});


// Nessages Sent
app.get(`${PREFIX}sent`, (req, res) => {
  return res.status(200).send({
    status: 'ok',
    messages: MESSAGES_SENT,
  });
});


app.get(`${PREFIX}sent/:id`, (req, res) => {
  const id             = req.params.id;
  let messageSelected  = {};

  MESSAGES_SENT.forEach((message) => {
    if (message.uid === id) {
      messageSelected = message
    }
  })

  return res.status(200).send({
    status: 'ok',
    message: messageSelected
  });
});

app.listen(PORT, 'localhost', (err) => {
  if (err) {
    console.log(err);
  }
  console.info(`The Magic Happens on port ${PORT}`);
});
