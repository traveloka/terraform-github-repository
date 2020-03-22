provider "github" {
  version = "2.4.1"
  organization = "salvianreynalditest"
}

module "this" {
  source                      = "../.."
  name                        = "my-experiment-repository"
  description                 = "my-experiment-repository"
  private                     = false

  repository_teams_permission = {
    "team1"="maintain"
    "team2"="triage"
  }

  repository_collaborators_permission = {
    "salvianreynaldi" = "admin"
  }
}
