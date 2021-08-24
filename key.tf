resource "aws_key_pair" "key_pair" {
  key_name   = "${var.company_name}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA0t3d7HOO3K9cZSLFqcKCLBofcVR9CDIDrlabGqUZADjHy1DqJcMHrJRZJuPjyV7I9BSbpIQzManBF8UYfOQ/W6a4VaR9wD07GuvaHhus1vjfuHeKjcLiYNMaxSEb7QFwPE3WrGlpQNC0Y2T0+NejzeNO3qbmviN/T8VXso8awWFuVju6DUMtW8ZOKm/u2KbnAryZ/BXk6/uWmfg+hyxcBOL74pfJzUKpwaC7AW958sGxvmrJa6RZWrEbmVenpu/wOA8sN74jskpwS5KbRwuMhKNMYt/oGNghpq/q9makYxcrIMLa2ZNAu8VIdQosINqlFhgRmkVwVbAtXU50fqgD+Q== rsa-key-20191113"
}