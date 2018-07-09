data "github_team" "push_teams" {
  count = "${length(var.push_teams)}"
  slug  = "${element(var.push_teams, count.index)}"
}

data "github_team" "pull_teams" {
  count = "${length(var.pull_teams)}"
  slug  = "${element(var.pull_teams, count.index)}"
}

data "github_team" "admin_teams" {
  count = "${length(var.admin_teams)}"
  slug  = "${element(var.admin_teams, count.index)}"
}

resource "github_repository" "main" {
  name               = "${var.name}"
  description        = "${var.description}"
  homepage_url       = "${var.homepage_url}"
  private            = "${var.private}"
  has_issues         = "${var.has_issues}"
  has_wiki           = "${var.has_wiki}"
  allow_merge_commit = "${var.allow_merge_commit}"
  allow_squash_merge = "${var.allow_squash_merge}"
  allow_rebase_merge = "${var.allow_rebase_merge}"
  has_downloads      = "${var.has_downloads}"
  auto_init          = "${var.auto_init}"
  gitignore_template = "${var.gitignore_template}"
  license_template   = "${var.license_template}"
  default_branch     = "${var.default_branch}"
}

resource "github_branch_protection" "main" {
  repository     = "${github_repository.main.name}"
  branch         = "${github_repository.main.default_branch}"
  enforce_admins = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    dismissal_users            = ["${var.dismiss_review_users}"]
    require_code_owner_reviews = true
  }
}

resource "github_team_repository" "push" {
  count      = "${length(data.github_team.push_teams.*.id)}"
  team_id    = "${element(data.github_team.push_teams.*.id, count.index)}"
  repository = "${github_repository.main.name}"
  permission = "push"
}

resource "github_team_repository" "pull" {
  count      = "${length(data.github_team.pull_teams.*.id)}"
  team_id    = "${element(data.github_team.pull_teams.*.id, count.index)}"
  repository = "${github_repository.main.name}"
  permission = "pull"
}

resource "github_team_repository" "admin" {
  count      = "${length(data.github_team.admin_teams.*.id)}"
  team_id    = "${element(data.github_team.admin_teams.*.id, count.index)}"
  repository = "${github_repository.main.name}"
  permission = "admin"
}

resource "github_repository_collaborator" "push" {
  repository = "${github_repository.main.name}"
  count      = "${length(var.push_collaborators)}"
  username   = "${element(var.push_collaborators, count.index)}"
  permission = "push"
}

resource "github_repository_collaborator" "pull" {
  repository = "${github_repository.main.name}"
  count      = "${length(var.pull_collaborators)}"
  username   = "${element(var.pull_collaborators, count.index)}"
  permission = "pull"
}

resource "github_repository_collaborator" "admin" {
  repository = "${github_repository.main.name}"
  count      = "${length(var.admin_collaborators)}"
  username   = "${element(var.admin_collaborators, count.index)}"
  permission = "admin"
}
