echo -e "---
AWS Account ID    => \e[1m$AWS_ACCOUNT_ID\e[m
Instance ID       => \e[1m$INSTANCE_ID\e[m
Instance Type     => \e[1m$INSTANCE_TYPE\e[m
Availability Zone => \e[1m$AVAILABILITY_ZONE\e[m"

if [ -n "$PUBLIC_HOSTNAME" ]; then
  echo -e "Public DNS Name   => \e[1m$PUBLIC_HOSTNAME\e[m"
fi

if [ -n "$TAGGED_NAME" ]; then
  echo -e "Tag::Name         => \e[1m$TAGGED_NAME\e[m"
fi
