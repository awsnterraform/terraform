# Create users with Read Only access to Ec2
resource "aws_iam_user" "ec2" {
	name = "${element(var.users_ec2, count.index)}"
	count = "${length(var.users_ec2)}"
}
# Create Users who have S3 access
resource "aws_iam_user" "s3" {
	name = "${var.users_s3}"
}
# List all the Ec2 created users
output "ec2_users" {
      value = ["${aws_iam_user.ec2.*.arn}"]
}
# List all s3 Created users
output "s3_users" {
      value = ["${aws_iam_user.s3.*.arn}"]
}
# Document IAM policy for Ec2 Users
data "aws_iam_policy_document" "ec2_read_only" {
	statement {
		effect = "Allow"
		actions = ["ec2:Describe*"]
		resources = ["*"]
	}
}
# Document IAM policy for s3 Users
data "aws_iam_policy_document" "s3_access" {
	statement {
		effect = "Allow"
		actions = ["s3:*"]
		resources = ["*"]
	}
}
# Create IAM policy for Ec2 Users
resource "aws_iam_policy" "s3_access" {	
	name = "s3_access"
	policy = "${data.aws_iam_policy_document.s3_access.json}"
}
# Create IAM policy for s3 Users
resource "aws_iam_policy" "ec2_read_only" {
	name = "ec2_read-only"
	policy = "${data.aws_iam_policy_document.ec2_read_only.json}"
}
# Attach IAM policy with Ec2 users
resource "aws_iam_user_policy_attachment" "ec2_access" {
	count = "${length(var.users_ec2)}"
	user = "${element(aws_iam_user.ec2.*.name, count.index)}"
	policy_arn = "${aws_iam_policy.ec2_read_only.arn}"
}
# Attach IAM policy with s3 users
resource "aws_iam_user_policy_attachment" "s3_access" {
	user = "${var.users_s3}"
	policy_arn = "${aws_iam_policy.s3_access.arn}"
}
		
