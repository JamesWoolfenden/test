# fails
# CKV_GCP_41: "Ensure that IAM users are not assigned the Service Account User or Service Account Token Creator roles at project level"
# CKV_GCP_49: "Ensure no roles that enable to impersonate and manage all service accounts are used at a project level"
# tfsec
# 'google_project_iam_member.project' grants IAM to a user object. It is recommended to manage user permissions with groups.

resource "google_project_iam_member" "project" {
  project = "your-project-id"
  role    = "roles/iam.serviceAccountUser"
  member  = "user:jane@example.com"
}
