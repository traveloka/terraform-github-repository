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

variable "push_teams" {
  type        = "list"
  default     = []
  description = "the GitHub teams which is granted push permission on the repository"
}

variable "pull_teams" {
  type        = "list"
  default     = []
  description = "the GitHub teams which is granted pull permission on the repository"
}

variable "admin_teams" {
  type        = "list"
  default     = []
  description = "the GitHub teams which is granted admin permission on the repository"
}

variable "push_collaborators" {
  type        = "list"
  default     = []
  description = "the GitHub users (can be from outside of the organization) which is granted push permission on the repository"
}

variable "pull_collaborators" {
  type        = "list"
  default     = []
  description = "the GitHub users (can be from outside of the organization) which is granted pull permission on the repository"
}

variable "admin_collaborators" {
  type        = "list"
  default     = []
  description = "the GitHub users (can be from outside of the organization) which is granted admin permission on the repository"
}

variable "dismiss_review_users" {
  type        = "list"
  default     = []
  description = "the users which is granted the access to dismiss review on the protected branch"
}

variable "force_pr_rebase" {
  type        = "string"
  default     = true
  description = "whether PR should have up to date branches (e.g. rebased) before they're merged"
}

variable "status_checks_contexts" {
  type        = "list"
  default     = []
  description = "The list of required status checks in order to merge into the protected branch, e.g. AWS CodeBuild ap-southeast-1 (<codebuild_project_name>)"
}
