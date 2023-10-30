terraform {
  backend "s3" {
    bucket = "terraform-b75"
    key    = "misc/jenkins-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-0d03910b43af7e01c"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.rdevopsb73.online"
  type    = "A"
  zone_id = "Z09059901XRPHNYMGLMJ4"
  records = [data.aws_instance.instance.public_ip]
  ttl     = 10
}


data "aws_instance" "artifactory" {
  instance_id = "i-0d8093e0d373c7bba"
}

resource "aws_route53_record" "artifactory" {
  name    = "artifactory.rdevopsb73.online"
  type    = "A"
  zone_id = "Z09059901XRPHNYMGLMJ4"
  records = [data.aws_instance.artifactory.public_ip]
  ttl     = 10
}

