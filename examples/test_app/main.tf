module "assumers" {
  source = "../../"

  assumers_with_policies = {
    "123456789012" = {
      "app-x" = {
        name = "some-table"
        policy = {
          Statement = [
            {
              Action = [
                "ecs:foo",
              ]
              Effect = "Allow"
              Resource = [
                "arn:aws:ecs:eu-central-1:123456789012:table/something"
              ]
            },
          ]
          Version = "2012-10-17"
        }
      }
    }
  }

  assumers = {
    "123456789012" = {
      "app-x" = {
        "dynamodb" = ["some-table"],
        "s3"       = ["foobar-bucket"]
      }
    }
  }
}
