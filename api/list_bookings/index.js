const AWS = require("aws-sdk")
AWS.config.update({
    region: process.env.AWS_REGION
})
const documentClient = new AWS.DynamoDB.DocumentClient();

module.exports.handler = async event => {
    if(event.requestContext.authorizer.role === "ADMIN"){
        const data = await documentClient.scan({
            TableName: process.env.DYNAMODB_BOOKINGS
        }).promise();
        return {
            statusCode: 200,
            body: JSON.stringify(data.Items)
        }
    }
    return {
        statusCode: 403,
        body: JSON.stringify({message:"Você não está autorizada a executar essa chamada"})
    }
}