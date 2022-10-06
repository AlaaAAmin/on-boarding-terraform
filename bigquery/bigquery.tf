resource "google_bigquery_dataset" "bigquery-dataset" {
  count         = length(var.datasets)
  dataset_id    = var.datasets[count.index].name
  friendly_name = var.datasets[count.index].name
  description   = "empty dataset for testing purposes"
  location      = var.location

  labels = {
    name = var.datasets[count.index].name
  }
}
