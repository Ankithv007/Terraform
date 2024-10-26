# Terraform Provisioners

## What are Terraform Provisioners?

Provisioners in Terraform are used to execute scripts or commands on a local or remote machine as part of the resource creation process. They allow you to automate the configuration and management of infrastructure after the resource has been created but before it is considered "ready." This is particularly useful for tasks that require initialization or setup beyond what Terraform can accomplish through its resource definitions.

## Why Use Provisioners?

Provisioners provide several benefits, including:

- **Customization**: They enable the customization of instances after their creation, such as installing software or configuring applications.
- **Automation**: They help automate setup tasks that would otherwise need to be performed manually.
- **Configuration Management**: Provisioners can work alongside configuration management tools like Ansible, Chef, or Puppet to ensure the desired state of a system.
- **Flexibility**: They can be tailored to fit specific use cases, allowing for scripts or commands to be executed based on the requirements of the infrastructure being provisioned.

## When to Use Provisioners

Although provisioners are powerful, they should be used judiciously. Here are some guidelines:

- **Use when necessary**: Only use provisioners when there's no suitable Terraform resource available to handle the task at hand.
- **Avoid complex logic**: If the logic is complex or requires a lot of scripting, consider using a configuration management tool.
- **Idempotence**: Ensure that your scripts are idempotent, meaning running them multiple times won't change the result beyond the initial application.

## Types of Provisioners

Terraform provides several types of provisioners:

1. **`local-exec`**: Executes a command on the machine where Terraform is run. This is useful for running local scripts or commands.
   
   Example:
   ```hcl
   resource "null_resource" "example" {
     provisioner "local-exec" {
       command = "echo Hello, World!"
     }
   }

### remote-exec: Executes commands on a remote machine, typically over SSH. This is useful for configuring servers after they have been provisioned.

```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe01e"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]

    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("~/.ssh/my_key.pem")
      host     = self.public_ip
    }
  }
}

```
## File Provisioner in Terraform

The `file` provisioner is used to copy files or directories from the local machine where Terraform is executed to a remote machine (like a cloud instance). This is particularly useful when you need to transfer configuration files, scripts, or other resources required for the setup of the remote machine.

### When to Use the File Provisioner

Use the `file` provisioner when:
- You have configuration files or scripts that need to be present on the remote machine after provisioning.
- You need to prepare an environment by transferring files that the remote server will utilize (e.g., application configuration files, startup scripts).

### Example of File Provisioner

Here’s an example of how to use the `file` provisioner to copy a local script to an AWS EC2 instance:

```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe01e"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  # Define the provisioner to copy a script
  provisioner "file" {
    source      = "setup.sh"              # The local file to be copied
    destination = "/home/ubuntu/setup.sh" # The path on the remote machine

    connection {
      type        = "ssh"                 # Connection type
      user        = "ubuntu"              # SSH user for the instance
      private_key = file("~/.ssh/my_key.pem")  # Path to the private key for SSH
      host        = self.public_ip        # Host is the public IP of the instance
    }
  }

  # Optionally, you can add a remote-exec provisioner to run the script
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/setup.sh",   # Make the script executable
      "/home/ubuntu/setup.sh"              # Run the script
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/my_key.pem")
      host        = self.public_ip
    }
  }
}
