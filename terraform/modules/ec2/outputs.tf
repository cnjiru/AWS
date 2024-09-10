output "jenkins_urls" {
  value = [for instance in aws_instance.myec2 : "http://${instance.public_ip}:8080"]
}