import boto3
sns = boto3.client('',region_name='')
# Publish a simple message to the specified SNS topic
response = sns.publish(
    TopicArn='',   
    Message='Intrati pe platforma Neews pentru a ramane la curent cu tot ce se intampla!',   
)

