output "full_name" {
  value       = github_repository.main.full_name
  description = "A string of the form 'orgname/reponame'"
}

output "clone_url" {
  value       = github_repository.main.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH"
}

