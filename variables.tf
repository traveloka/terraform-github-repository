variable "name" {
  type        = string
  description = "the repository name"
}

variable "description" {
  type        = string
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

variable "dismiss_review_users" {
  type        = list(string)
  default     = []
  description = "the users which is granted the access to dismiss review on the protected branch"
}

variable "repository_teams_permission" {
  type        = map(string)
  description = "the team permission settings for the repository; each team is mapped to a permission (admin, pull, or push)"
}

variable "repository_collaborators_permission" {
  type        = map(string)
  description = "the collaborator permission settings for the repository; each username is mapped to a permission (admin, pull, or push)"
}

variable "force_pr_rebase" {
  type        = string
  default     = true
  description = "whether PR should have up to date branches (e.g. rebased) before they're merged"
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "the repository topics"
}

variable "archived" {
  type        = string
  default     = false
  description = "whether the repository should be archived or not"
}

variable "enforce_admins" {
  type        = string
  default     = true
  description = "whether the admin should be enforced for branch protection or not"
}

variable "status_checks_contexts" {
  type        = list(string)
  default     = []
  description = "The list of required status checks in order to merge into the protected branch, e.g. AWS CodeBuild ap-southeast-1 (<codebuild_project_name>)"
}

variables "template_repository" {
  type        = string
  default     = ""
  description = "The name of repository template for creating the new repository" 
}

variables "template_owner" {
  type        = string
  default     = "traveloka"
  description = "The name of organization who owned the repository template" 
}
