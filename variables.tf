variable "name" {
  type = "string"
}

variable "description" {
  type = "string"
}

variable "homepage_url" {
  default = ""
}

variable "private" {
  default = true
}

variable "has_issues" {
  default = true
}

variable "has_wiki" {
  default = false
}

variable "allow_merge_commit" {
  default = false
}

variable "allow_squash_merge" {
  default = true
}

variable "allow_rebase_merge" {
  default = false
}

variable "has_downloads" {
  default = false
}

variable "auto_init" {
  default = true
}

variable "gitignore_template" {
  default = ""
}

variable "license_template" {
  default = ""
}

variable "default_branch" {
  default = ""
}
