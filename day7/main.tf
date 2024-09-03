provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = <add the ip adress after the creation also change the sg manually port 8200>
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = <add the role id>
      secret_id = <add the secret id>
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "secret-key" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
