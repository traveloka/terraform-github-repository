data "github_team" "owner" {
  slug = "${var.owner}"
}

data "github_team" "other_teams" {
  count = "${length(var.teams)}"
  slug  = "${element(var.teams, count.index)}"
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
    dismissal_teams            = ["${data.github_team.owner.name}"]
    require_code_owner_reviews = true
  }

  depends_on = ["github_team_repository.main"]
}

resource "github_team_repository" "main" {
  team_id    = "${data.github_team.owner.id}"
  repository = "${github_repository.main.name}"
  permission = "push"
}

resource "github_team_repository" "other_teams_repository" {
  count      = "${length(data.github_team.other_teams.*.id)}"
  team_id    = "${element(data.github_team.other_teams.*.id, count.index)}"
  repository = "${github_repository.main.name}"
  permission = "pull"
}
