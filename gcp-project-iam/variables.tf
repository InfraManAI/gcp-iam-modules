variable "projectid" {
  default = ""
}

variable "policy_set_policy" {
  type = map(
  object({
    members = list(string)
    service_accounts = list(string)
    roles = list(string)
    desc = string

  })
  )
}

variable "policy_set_member" {
  type = map(
  object({
    members = list(string)
    service_accounts = list(string)
    roles = list(string)
    desc = string

  })
  )
}