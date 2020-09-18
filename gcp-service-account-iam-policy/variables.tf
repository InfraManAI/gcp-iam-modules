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
  default = {
    pdefault = {
      members_policy = []
      service_accounts_policy = []
      roles_policy = []
      desc_policy = ""
    }
  }
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
  default = {
    pdefault = {
      members_binding = []
      service_accounts_binding = []
      roles_binding = []
      desc_binding = ""
    }
  }
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
  default = {
    pdefault_member = {
      members_member = []
      service_accounts_member = []
      roles_member= []
      desc_member = ""
    }
  }
}