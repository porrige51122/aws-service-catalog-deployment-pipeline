# Deployment Example

This is a fully deployable example of the aws service catalog deployment
pipeline module.

This example deploys:
  
 - A S3 Bucket with a randomly generated unique name
 - A S3 Object of a Cloudformation template [./cloudformation/example-ec2.json](./cloudformation/example-ec2.json)
 - A Service Catalog product with the default name of "example_product" (see [./variables.tf](./variables.tf))
 - A Custom Codebuild buildspec (see [./buildspecs/custom_specification.yml](./buildspecs/custom_specification.yml))

These Resources will be deployed to your account as they are needed for this
module to work as intended.

It will then pass in these as variables to the module at [../module](../module).

## How to use

*Warning* - This requires some knowledge on how to navigate the cli

First we need to login to an aws account via the cli. This can take many forms, however, the simplest way is to export the relevant variables to your cli:

```
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export AWS_SESSION_TOKEN=...
```

Next, we need to initialize the terraform inside the ./examples directory:

```
terraform init
```

Next, we are ready to deploy. Run:

```
terraform apply
```
Check that everything deployed is what you expect, then click yes once you are
happy.

Done. If you want to confirm, you can log in to the online console and head to
the codepipeline service page at [us-east-1.console.aws.amazon.com/codesuite/codepipeline/pipelines](https://us-east-1.console.aws.amazon.com/codesuite/codepipeline/pipelines) 
(note the region us-east-1, navigate to your preferred region is needed)
