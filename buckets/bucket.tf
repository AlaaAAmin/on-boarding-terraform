resource "google_storage_bucket" "gs-bucket" {
  #making multiple buckets with STANDARD storage class
  count    = length(var.buckets)
  name     = var.buckets[count.index].name
  location = var.location
}
