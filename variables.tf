variable "role_name" {
  description = "Nome da Role"
  type        = string
}

variable "assume_role_policy_document" {
  description = "Documento JSON da política de confiança da Role"
  type        = string
}

variable "policies" {
  description = "Lista de definições de política"
  type        = list(object({
    name        = string
    description = string
    document    = string
  }))
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
  validation {
    condition = contains(keys(var.tags), "git_repository")
    error_message = "The 'git_repository' tag is mandatory."
  }
}

variable "existing_policy_arns" {
  description = "A list of ARNs of existing IAM policies to attach to the role"
  type        = list(string)
  default     = []
}
