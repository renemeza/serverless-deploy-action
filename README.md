# Serverless actions

Actions for release and deploy serverless infrastructure

## Usage

Use in conjuction with https://github.com/unacast/actions/tree/master/github-deploy action to get the deployment environment and to start and complete the deployment

```
workflow "Release and Deploy" {
  on = "deployment"
  resolves = [
    "End Deployment",
  ]
}

action "Filter deleted branches" {
  uses = "UltCombo/action-filter-deleted-branches@master"
}

action "Add deploy scripts" {
  needs = "Filter deleted branches"
  uses = "unacast/actions/github-deploy@master"
}

action "Init deployment" {
  needs = "Add deploy scripts"
  uses = "docker://byrnedo/alpine-curl"
  runs = "/github/home/bin/deployment-create-status pending"
}

action "Release" {
  needs = "Init deployment"
  uses = "getndazn/serverless-action"
  args = "release"
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
    "NPM_AUTH_TOKEN",
  ]
  env = {
    AWS_REGION = "us-east-1"
  }
}

action "Deploy" {
  needs = "Release"
  uses = "getndazn/serverless-action"
  args = "deploy"
  secrets = [
    "AWS_ACCESS_KEY_ID",
    "AWS_SECRET_ACCESS_KEY",
    "NPM_AUTH_TOKEN",
  ]
  env = {
    AWS_REGION = "us-east-1"
  }
}

action "End Deployment" {
  needs = "Deploy"
  uses = "docker://byrnedo/alpine-curl"
  runs = "/github/home/bin/deployment-create-status success"
}
```
