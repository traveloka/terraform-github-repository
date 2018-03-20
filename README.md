# terraform-github-repository
A Terraform module which creates a github repository

## Usage
```hcl
module "my-repository" {
    source = "github.com/traveloka/terraform-github-repository?ref=master"
    name = "flight-api"
    description = "flight team repository that contains flight backend API module"
}

```

## Conventions
  -  "owner" variable value will be prefixed to the repository name for private repositories

## Authors
  - [Salvian Reynaldi](https://github.com/salvianreynaldi)

## License

Apache License 2.0. See LICENSE for full details.
