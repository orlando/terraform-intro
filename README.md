# Terraform Intro

This repo has many branches. Each branch represent an incremental
terraform state. You can go through each branch an apply your changes
(`terraform apply`) to see how that works

## Usage

We are going to use AWS for this. So you need to provide your access
keys as environment variables. Check `env.sample` to see what variables
are required.

If you don't have an AWS account, you can create one (A credit card is
required) at [aws.amazon.com](https://aws.amazon.com). This examples works
under their free-tier plan. So it shouldn't cost you anything.

Once you have your access keys for AWS, run this:

```bash
cp env.sample .env
# replace your AWS access keys in the .env file you just created
source .env
```

Make sure when you end using the example, to teardown everything using
`terraform destroy`

### Installing terraform

If you are on OSX, you should have homebrew installed (if not installed
it, you have been missing one of the best tools for devs in OSX)

`brew install terraform`

### Branches

Once you reach this point, you should be able to run terraform commands
without problems.

In each branch you should run first `terraform plan` to see the changes,
and then `terraform apply` to apply the changes. Before continue to the
other branches, if you want to apply, run `terraform destroy` before

Once you are done running the examples, you can run `terraform destroy`
to teardown the resources you created

#### master
* Creating a basic EC2 instance

#### step2
* Adding an EIP to that instance

#### step3
* Exposing instance type as a variable

#### step4
* Moving everything to a module

#### step5
* Adding documentation with [terraform-docs](https://github.com/segmentio/terraform-docs)
