// A simple token-based authorizer example to demonstrate how to use an authorization token
// to allow or deny a request. In this example, the caller named 'user' is allowed to invoke
// a request if the client-supplied token value is 'allow'. The caller is not allowed to invoke
// the request if the token value is 'deny'. If the token value is 'unauthorized' or an empty
// string, the authorizer function returns an HTTP 401 status code. For any other token value,
// the authorizer returns an HTTP 500 status code.
// Note that token values are case-sensitive.
const jwt = require("jsonwebtoken");
exports.authorizer = function (event, context, callback) {
  const token = event.authorizationToken;
  try {
    const user = jwt.verify(token, process.env.JWT_SECRET);
    callback(null, generatePolicy("user", "Allow", event.methodArn, user));
  } catch (error) {
    console.log(error);
    callback(null, generatePolicy("user", "Deny", event.methodArn));
  }
};

// Help function to generate an IAM policy
const generatePolicy = function (principalId, effect, resource, user) {
  const authResponse = {};

  authResponse.principalId = principalId;
  if (effect && resource) {
    const policyDocument = {};
    policyDocument.Version = "2012-10-17";
    policyDocument.Statement = [];
    const statementOne = {};
    statementOne.Action = "execute-api:Invoke";
    statementOne.Effect = effect;
    statementOne.Resource = resource;
    policyDocument.Statement[0] = statementOne;
    authResponse.policyDocument = policyDocument;
  }

  // Optional output with custom properties of the String, Number or Boolean type.
  if (user) {
    authResponse.context = user;
  }

  return authResponse;
};
