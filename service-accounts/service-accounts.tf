#role    = "roles/container.admin" # admin access to kubernertes cluster
#role    = "roles/storage.admin" # access to storage admin

resource "google_service_account" "svc-accounts" {
  count        = length(var.svc-accounts-names)
  account_id   = var.svc-accounts-names[count.index].id
  display_name = var.svc-accounts-names[count.index].name
}
resource "google_project_iam_binding" "svc-account-binding" {
  count   = length(var.svc-accounts-names)
  project = var.project-id

  role = (
    google_service_account.svc-accounts[count.index].account_id == "gcr-sa" ? ("roles/storage.viewer")
    :
    (google_service_account.svc-accounts[count.index].account_id == "gs-buckets-sa" ? ("roles/storage.objectViewer")
      :
  ("roles/bigquery.dataEditor")))

  members = [
    "serviceAccount:${google_service_account.svc-accounts[count.index].email}"
  ]
}
