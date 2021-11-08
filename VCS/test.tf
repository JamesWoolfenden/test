resource "azuread_user" "chris_densham" {
  department            = "Infrastructure"
  display_name          = "Chris Densham"
  force_password_change = true
  given_name            = "Chris"
  job_title             = "Infrastructure Engineer"
  #bridgecrew:skip=BC_GIT_6:We have to set a password here but changing it is enforced.       <<<<<<<<<<<<<
  password            = "changeme-sy2xPjgW" # NOTE: Changing this will be forced.
  surname             = "Densham"
  user_principal_name = "chris.densham@matillion.com"
}