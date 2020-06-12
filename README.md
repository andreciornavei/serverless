# serverless

[Technologies](#-technologies)
|
[Installing](#-installing)
|
[License](#-license)


This project was created with the objective of being a base of studies for serverless technologies, using aws technologies in together with Serverless and terraform frameworks.

---

## Technologies

This project was developed with the following technologies:

- [Node.js][nodejs]
- [TypeScript][typescript]
- [Express][express]
- [Terraform][terraform]
- [Serverless Framework][serverless]
- [AWS][aws]

---

## Installing

Well, the serverless architecture needs some technologies to keep everything organized and abstract all the complexity from the cloud provider. So, to start this project we need to install this technologies in our computer. 

---

### 1.1 AWS CLI

In first of all we need to install the _`aws-cli`_, it will allow us to manage our AWS credentials in our local machine that will be used by Serverless and Terraform technologies.

So, for that, follow [this link](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) to install `aws-cli` in your computer.

_After install `aws-cli` the command `aws` will be enabled in your command line to manage your aws account._

---

### 1.2 AWS Credentials

#### 1.2.1 Creating an account

Once you have the AWS CLI installed, you will need to have an account in [AWS](https://aws.amazon.com/) to manage your credentials, for that, create your aws account in [this link](https://portal.aws.amazon.com/billing/signup#/start) to proceed.

#### 1.2.2 Creating AWS IAM Credentials

You will need to generate IAM credentials at AWS Panel to access it programmatically and allow Serverless and Terraform access.

Make sure to allow `Programmatic access` and provide `AdministratorAccess` to this user for Serverless and Terraform be able to manage this infrastructure.

To see the documentation about how to create your IAM credentials, see [this link](https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/getting-your-credentials.html).

_After generate your credential file, provide it credentials using the AWS CLI command line:_

```bash
$ aws configure
```

Once you type this command, the console will ask yours `<access_key_id>`, `<secret_access_key>` and `<region>` you want to work with the infrastructure.

After that, you're done, all the platforms that use the aws cli to manage your aws panel, will use it to run theses commands.

---

### 1.3 NodeJS

This project was developed using NodeJs, and also, need the npm (node package manager) to install the Serverless Framework CLI in the next steps, so you have to make sure to have this installed and configured in your environment.


To download and install the NodeJS, follow [this link](https://nodejs.org/en/download/).

---

### 1.4 Serverless Framework

For now, we must have the `serverless cli` available to execute the management of our lambda functions. To install it, run the command below:

```bash
$ npm install -g serverless
```

For more knowledge about serverless, see the docs at [serverless](https://www.serverless.com/framework/docs/).

---

### 1.5 Terraform

You will need to install terraform executable to manage your infrastructure as a code, so follow these steps:

- Access [this link](https://www.terraform.io/downloads.html)
- Download the appropriate package
- Unzip it
- Add terraform executable to yout path

_When you're done, you will be able to run `terraform` cli command._

```bash
$ terraform
Usage: terraform [--version] [--help] <command> [args]
```

For this project we going to use the [AWS](https://www.terraform.io/docs/providers/aws/index.html) provider.

---

## License

This project is under the MIT license. See the [LICENSE](./LICENSE) for details.

Developed by André Ciornavei - [Get in touch!](https://www.linkedin.com/in/andreciornavei/)


[nodejs]: https://nodejs.org/
[typescript]: https://www.typescriptlang.org/
[express]: https://expo.io/
[terraform]: https://reactjs.org
[serverless]: https://facebook.github.io/react-native/
[aws]: https://yarnpkg.com/