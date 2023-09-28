variable "ingress-ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 8080, 80, 3306]

}


variable "sg_name" {
  type = string
  default = ""
  description = "Nome do SG"
}