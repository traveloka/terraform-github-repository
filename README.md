# terraform-github-repository
A Terraform module which creates a github repository. terraform v0.12.x is required.

## Usage
```hcl
module "my-repository" {
    source = "github.com/traveloka/terraform-github-repository?ref=master"
    name = "flight-api"
    description = "flight team repository that contains flight backend API module"

    // setting permission
    repository_teams_permission = {
      <team_1> = "admin"
      <team_2> = "triage"
      <team_3> = "maintain"
      <team_4> = "push"
      <team_5> = "pull"
    }

    repository_collaborators_permission = {
      <username_1> = "admin"
      <username_2> = "push"
      <username_3> = "pull"
    }

    // see other available parameters in the variables.tf file
}

```

## Caveat
### terraform for_each and count
The `repository_collaborators_permission` utilizes terraform 0.12's `for_each` meta-argument, so list reordering (e.g. reversing item order inside the list) is fine.

However, it's not the case with `repository_teams_permission` as it's not as straightforward as collaborators (terraform needs team id, not team name). Therefore, reorganizing the items in this list will force resource recreation (old permission will be deleted, which potentially disable your access to the repository)

### new permissions
`triage` and `maintain` permission doesn't seem to work with `repository_collaborators_permission`. Read https://github.com/terraform-providers/terraform-provider-github/pull/303#issuecomment-602178599

## Authors
  - [Salvian Reynaldi](https://github.com/salvianreynaldi)


## License

Apache License 2.0. See LICENSE for full details.
