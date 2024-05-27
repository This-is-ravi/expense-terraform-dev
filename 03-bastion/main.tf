# same like ec2 instance creation and this is open source module we can get it from internet github

module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.project_name}-${var.environment}-bastion"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_sg_id.value] #fetching sg_id through datasource from aws->ssm
  # convert StringList to list and get first element
  subnet_id = local.public_subnet_id #how select a element from a list in tf. through element fun, store it in locals
  ami = data.aws_ami.ami_info.id # how to get ami from aws console i.e through data source
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion" #expense-dev-bastion
    }
  )
}