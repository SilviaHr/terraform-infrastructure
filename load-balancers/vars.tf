# Input variable: server port
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = "8080"
}

variable "vpc_id" {
  default = "vpc-09f578d308834afdd"
}
