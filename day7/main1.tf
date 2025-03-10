provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address         = "http://13.127.183.99:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "fecb6174-3a50-db93-9bbc-3446e691a3a4"
      secret_id = "2d2e34a4-6180-a4fd-60b5-1ad2a045eafa"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"          # Adjust this according to your mount
  name  = "test-secret"   # Adjust this according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"

  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
