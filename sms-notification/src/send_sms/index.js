"use strict";

const messagebird = require("messagebird")(process.env.MESSAGE_BIRD_API_KEY);
const util = require("util");
const create_message = util.promisify(messagebird.messages.create);

module.exports.handler = async (event) => {
  const smsPromises = [];
  for (const record of event.Records) {
    const message = JSON.parse(record.body).Message;
    smsPromises.push(
      create_message({
        originator: process.env.SMS_PHONE_FROM,
        recipients: [process.env.SMS_PHONE_TO],
        body: message,
      })
    );
  }
  await Promise.all(smsPromises);
  console.log("SMSs enviados com sucesso")
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: "Go Serverless v1.0! Your function executed successfully!",
    }),
  };
};
