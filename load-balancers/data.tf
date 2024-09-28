data "aws_security_groups" "app-alb" {
  filter {
    name   = "group-name"
    values = ["*application*"]
  }
}

data "aws_security_groups" "grafana-alb" {
  filter {
    name   = "group-name"
    values = ["*grafana*"]
  }
}