module "this" {
  source                      = "../.."
  name                        = "my-experiment-repository"
  description                 = "my experiment repository"
  private                     = false

  repository_teams_permission = {
    "team_1" = "pull"
    "team_1" = "push"
    "team_1" = "admin"

    # only the last setting below ("push") will be applied for "team_1"
    "team_1" = "push"
    "team_2" = "push"
    "team_3" = "pull"
  }

  repository_collaborators_permission = {
    "user_1" = "admin"
    "user_2" = "pull"
    "user_3" = "admin"
    "user_3" = "push"
    "user_3" = "pull"

    # only the last setting below ("admin") will be applied for "user_3"
    "user_3" = "admin"
  }
}
