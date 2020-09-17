variable "policy_data_policy" {
  type = string
  default = ""
}
variable "service_account_id_policy" {
  type = string
  default = ""
}
variable "condition_policy" {
  type = map(string)
  default = {}
}

variable "members_member" {
  default = ""
}
variable "role_member" {
  default = ""
}
variable "service_account_id_member" {
  default = ""
}
variable "condition_member" {
  default = ""
}


variable "members_binding" {
  default = ""
}
variable "role_binding" {
  default = ""
}
variable "service_account_id_binding" {
  default = ""
}
variable "condition_binding" {
  default = ""
}

variable "count_member" {
  type = number
  default = 0
}

variable "count_binding" {
  type = number
  default = 0
}

variable "count_policy" {
  type = number
  default = 0
}

variable "policy_set" {
  type = map(
  object({
    members = list(string)
    service_accounts = list(string)
    roles = list(string)
    mode = string
    desc = string

  })
  )
  default = {
    pdefault = {
      members = []
      service_accounts = []
      roles = []
      mode = ""
      desc = ""
    }
  }
}