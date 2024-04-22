run "assumers" {
  module {
    source = "./examples/test_app"
  }

  command = plan

  assert {
    condition     = length(module.assumers.account_applications) != 0
    error_message = "No predetermined roles were created"
  }

  assert {
    condition     = length(module.assumers.account_applications_p) != 0
    error_message = "No policy driven roles were created"
  }
}
