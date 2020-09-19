variable "policy_set_policy" {
  type = map(
  object({
    members_policy = list(string)
    service_accounts_policy = list(string)
    roles_policy = list(string)
    desc_policy = string

  })
  )
}