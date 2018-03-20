variable "name" {
  type        = "string"
  description = "the repository name"
}

variable "description" {
  type        = "string"
  description = "the repository description"
}

variable "homepage_url" {
  default     = ""
  description = "the repository homepage URL, if any"
}

variable "private" {
  default     = true
  description = "set whether the repository visibility is private"
}

variable "has_issues" {
  default     = true
  description = "enable github issues feature for the repository"
}

variable "has_wiki" {
  default     = false
  description = "enable github wiki feature for the repository"
}

variable "allow_merge_commit" {
  default     = false
  description = "allow merge commit to this repository"
}

variable "allow_squash_merge" {
  default     = true
  description = "allow squash merge commit to this repository"
}

variable "allow_rebase_merge" {
  default     = false
  description = "allow rebase merge commit to this repository"
}

variable "has_downloads" {
  default     = false
  description = "enable github download feature for the repository"
}

variable "auto_init" {
  default     = true
  description = "set whether an initial commit should be made to the repository"
}

variable "gitignore_template" {
  default     = ""
  description = "select github gitignore tempate to init the repository with; see https://github.com/github/gitignore"
}

variable "license_template" {
  default     = ""
  description = "select github license tempate to init the repository with; see https://github.com/github/choosealicense.com/tree/gh-pages/_licenses"
}

variable "default_branch" {
  default     = ""
  description = "the name of the default branch of the repository. Only applicable if the repository and the branch is already created"
}

variable "owner" {
  type        = "string"
  description = "owner of the repository. will be prefixed to the name for private repositories"
}
