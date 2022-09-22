# Allow EC2 instances to assume the role
data "aws_iam_policy_document" "ghactions_assume_role_policy" {
    statement {
        actions = [
            "sts:AssumeRole"
        ]
        effect = "Allow"
        principals {
            type        = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}

# Create the policy which allows other actions for the EC2 instance
data "aws_iam_policy_document" "ghactions_ami_policy" {
    statement {
        actions = [
            "ec2:AttachVolume",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:CopyImage",
            "ec2:CreateImage",
            "ec2:CreateKeypair",
            "ec2:CreateSecurityGroup",
            "ec2:CreateSnapshot",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:DeleteKeyPair",
            "ec2:DeleteSecurityGroup",
            "ec2:DeleteSnapshot",
            "ec2:DeleteVolume",
            "ec2:DeregisterImage",
            "ec2:DescribeImageAttribute",
            "ec2:DescribeImages",
            "ec2:DescribeInstances",
            "ec2:DescribeInstanceStatus",
            "ec2:DescribeRegions",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSnapshots",
            "ec2:DescribeSubnets",
            "ec2:DescribeTags",
            "ec2:DescribeVolumes",
            "ec2:DetachVolume",
            "ec2:GetPasswordData",
            "ec2:ModifyImageAttribute",
            "ec2:ModifyInstanceAttribute",
            "ec2:ModifySnapshotAttribute",
            "ec2:RegisterImage",
            "ec2:RunInstances",
            "ec2:StopInstances",
            "ec2:TerminateInstances",
            "iam:PassRole",
            "iam:CreateInstanceProfile",
            "iam:DeleteInstanceProfile",
            "iam:GetRole",
            "iam:GetInstanceProfile",
            "iam:DeleteRolePolicy",
            "iam:RemoveRoleFromInstanceProfile",
            "iam:CreateRole",
            "iam:DeleteRole",
            "iam:PutRolePolicy",
            "iam:AddRoleToInstanceProfile"
        ]
        effect = "Allow"
        resources = ["*"]
    }
}

resource "aws_iam_role" "ghactions_ami_role" {
    name               = "ghactions_ami_role"
    assume_role_policy = data.aws_iam_policy_document.ghactions_assume_role_policy.json
    
    # Attach the policy
    inline_policy {
        policy = data.aws_iam_policy_document.ghactions_ami_policy.json
    }
}