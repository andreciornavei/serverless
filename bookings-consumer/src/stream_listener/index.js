"use strict";

const AWS = require("aws-sdk");
const converter = AWS.DynamoDB.Converter;

module.exports.handler = async (event) => {
  
  for (const record of event.Records) {
    console.log(
      "JSON parseado",
      converter.unmarshall(record.dynamodb.NewImage)
    );
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      message: "Go Serverless v1.0! Your function executed successfully!",
    }),
  };
};
