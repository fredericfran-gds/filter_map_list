# Terraform Filter Map and Get List

The terraform [file](main.tf) demonstrates how to filter a map of key-value pair and get the map index of the keys which satisfy a given criteria. The main terraform resource used is: `null_data_source`

## Requirements

The code was tested with:
1. terraform version `0.11.7`

## Demonstration

1. Given a terraform input [file](terraform.tfvars):
   ```
   listener_action={
       "HTTPS:43" = "HTTP:80"
       "HTTP:80"   = "HTTP:80"
       "HTTPS:443" = "HTTP:80"
       "HTTPS:543" = "HTTP:80"
   }
   ```

2. run the terraform logic situated in [file](main.tf) using command:
   ```
   terraform init
   terraform apply --var-file terraform.tvars
   ```

3. the output should be:
   ```
   Outputs:

    index_key_https = [
     1,
     2,
     3
    ]

    input_map = {
     HTTP:80 = HTTP:80
     HTTPS:43 = HTTP:80
     HTTPS:443 = HTTP:80
     HTTPS:543 = HTTP:80
    }
   ```
   where the `input_map` value is how terraform ordered the input map provided in step (1)
   and the `index_key_https` is a list of key index which has `HTTPS` in the key, i.e.
   1, 2 and 3.
