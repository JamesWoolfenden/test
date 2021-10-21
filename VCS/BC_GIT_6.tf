resource "azuread_user" "james_woolfenden" {
  department            = "Infrastructure"
  display_name          = "James Woolfenden"
  force_password_change = true
  given_name            = "James"
  job_title             = "Infrastructure Engineer"
  #bridgecrew:skip=BC_GIT_6:We have to set a password here but changing it is enforced.
  password              = "changeme-dy2xPjgW"
  surname               = "Woolfenden"
  user_principal_name   = "james.woolfenden@gmail.com"
}