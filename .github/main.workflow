workflow "psake" {
  on = "push"
  resolves = "test"
}

action "test" {
  uses  = "devblackops/psake-github-actions/task@master"
  args  = "test"
}
