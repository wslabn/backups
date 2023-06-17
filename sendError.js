var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'gmailuser',
    pass: 'securepassword'
  }
});

var mailOptions = {
  from: 'fromaddress',
  to: 'toaddress',
  subject: 'Error Backing up DC-Nas',
  text: 'Check DC Graphics Backup!'
};

transporter.sendMail(mailOptions, function (error, info) {
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});