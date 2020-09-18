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
    members = list(string)
    service_accounts = list(string)
    roles = list(string)
    desc = string

  })
  )
  default = {
    pdefault = {
      members = []
      service_accounts = []
      roles = []
      desc = ""
    }
  }
}
variable "policy_set_binding" {
  type = map(
  object({
    members = list(string)
    service_accounts = list(string)
    roles = list(string)
    desc = string

  })
  )
  default = {
    pdefault = {
      members = []
      service_accounts = []
      roles = []
      desc = ""
    }
  }
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
  default = {
    pdefault = {
      members = []
      service_accounts = []
      roles = []
      desc = ""
    }
  }
}