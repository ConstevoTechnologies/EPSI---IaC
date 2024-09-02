variable "name" {
  description = "The resource group name"
}

variable "location" {
  description = "The resource group location"
}

variable "lock_level" {
  description = "Lock level"
}

variable "notes" {
  description = "notes about the lock"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}