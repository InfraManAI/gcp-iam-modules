variable "policy_set" {
  type = map(
  object({
    members = list(string)
    service_accounts = list(string)
    roles = list(string)
    desc = string

  })
  )
}