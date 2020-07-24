# Required inputs

variable "description" {
  type        = string
  description = "the repository description"
}

variable "name" {
  type        = string
  description = "the repository name"
}

variable "repository_collaborators_permission" {
  type        = map(string)
  description = "the collaborator permission settings for the repository; each username is mapped to a permission (admin, pull, or push)"
}

variable "repository_teams_permission" {
  type        = map(string)
  description = "the team permission settings for the repository; each team is mapped to a permission (admin, pull, or push)"
}

# Optional inputs, check at code tab

variable "homepage_url" {
  default     = ""
  description = "the repository homepage URL, if any"
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "the repository topics to help searching in Github"
}

# Optional inputs, check at settings tab

variable "allow_merge_commit" {
  default     = false
  description = "allow landing a PR by merge commit in this repository, note this is incompatible with linear history requirement"
}

variable "allow_rebase_merge" {
  default     = false
  description = "allow landing a PR by rebasing all commits to base branch as is in this repository"
}

variable "allow_squash_merge" {
  default     = true
  description = "allow landing a PR by squashing all commits to a commit and rebase to base branch in this repository"
}

variable "archived" {
  type        = string
  default     = false
  description = "whether the repository should be archived or not, note that it's impossible to unarchive repos from Github API for now, so leave this at false for now"
}

variable "default_branch" {
  default     = ""
  description = "the name of the default branch of the repository. Only applicable if the repository and the branch is already created"
}

variable "has_downloads" {
  default     = false
  description = "enable github downloads API for the repository, this API is already deprecated, it's best to disable it"
}

variable "has_issues" {
  default     = true
  description = "enable github issues feature for the repository"
}

variable "has_wiki" {
  default     = false
  description = "enable github wiki feature for the repository"
}

variable "private" {
  default     = true
  description = "set whether the repository visibility is private, note only github admins can switch this once a repository is created"
}

# Optional inputs, for default branch protection rule (in settings/branches)

variable "dismiss_review_users" {
  type        = list(string)
  default     = []
  description = "the users which is granted the access to dismiss review on the protected branch"
}

variable "enforce_admins" {
  type        = string
  default     = true
  description = "whether the admin should be enforced to follow the branch protection rule or not"
}

variable "force_pr_rebase" {
  type        = string
  default     = true
  description = "whether PR should have up-to-date base branch (e.g. rebased) before they're merged"
}

variable "status_checks_contexts" {
  type        = list(string)
  default     = []
  description = "The list of required status checks in order to merge into the protected branch, e.g. AWS CodeBuild ap-southeast-1 (<codebuild_project_name>)"
}

# Optional inputs, for setting initial commit in the new repository

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

# Optional input, for using a repository template to initialize the repository
# known interactions:
# - auto_init set to false, template_repository and template_owner filled -> there is still a commit "Initial commit" that matches the template
# - auto_init set to true, template_repository and template_owner left with default value -> Initial commit with just README.md
# - template_repository set to null -> error

variable "template_repository" {
  type        = string
  default     = ""
  description = "The name of repository template for creating the new repository"
}

variable "template_owner" {
  type        = string
  default     = ""
  description = "The name of organization who owned the repository template"
}
