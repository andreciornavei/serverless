
const AWS = require("aws-sdk")
AWS.config.update({
    region: process.env.AWS_REGION,
})
const documentClient = new AWS.DynamoDB.DocumentClient();
const { uuid } = require("uuidv4")

module.exports.handler = async event => {
    const body = JSON.parse(event.body)
    await documentClient.put({
        TableName: process.env.DYNAMODB_BOOKINGS,
        Item : {
            id: uuid(),
            date: body.date,
            user: event.requestContext.authorizer
        }
    }).promise()
    return {
        statusCode: 200,
        body: JSON.stringify({
            message: "Agendamento realizado com sucesso"
        })
    }
}