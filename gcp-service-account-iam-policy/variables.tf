variable "members_dic" {
  default = {}
}

variable "service_account_dic" {
  default = {}
}

variable "roles_dic" {
  default = {}
}

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

variable "policy_set_binding" {
  type = map(
  object({
    members_binding = list(string)
    service_accounts_binding = list(string)
    roles_binding = list(string)
    desc_binding = string
  })
  )
}

variable "policy_set_member" {
  type = map(
  object({
    members_member = list(string)
    service_accounts_member = list(string)
    roles_member = list(string)
    desc_member = string

  })
  )
}