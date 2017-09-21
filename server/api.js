const express     = require('express');
const app         = express();
const morgan      = require('morgan');
const bodyParser  = require('body-parser');
const MESSAGES    = require('./messages');

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

app.get(`${PREFIX}inbox`, (req, res) => {
    return res.status(200).send({
      status: 'ok',
      messages: MESSAGES,
    });
});

app.get(`${PREFIX}inbox/:id`, (req, res) => {
  const id             = req.params.id;
  let messageSelected  = {};

  MESSAGES.forEach((message) => {
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
