workflow "psake" {
  on = "push"
  resolves = "test"
}

action "test" {
  uses  = "devblackops/psake-github-action@master"
  args  = "test"
}
