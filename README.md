# tf_saas_service_infra
Terraform module for my saas service infrastructure

# Steps to add to new project

## Add to gitignore

.gitignore in root repo directory must include:
```
.terraform.lock.hcl
terraform.tfstate
terraform.tfstate.backup
.terraform
```

## Copy terraform from existing directory

Includes localterraform script and terraform code.

Remove .ash_history and .terraform if they come across

## Edit main.tf

Edit main.tf to match the spec of the new module

## Add steps to codefresh.yml

First make sure RJM_DOCKERWSCALLER_IMAGE version is latest version.

Make sure MEMSET_CLOUD_ROOT variable is set in first stage (It is not always)

My basic no check step is as follows:
```
run_terraform:
  title: "Run terraform on memset..."
  description: Compile the frontend quasar application
  image: ${{RJM_DOCKERWSCALLER_IMAGE}}
  working_directory: ${{main_clone}}
  environment:
    - SSH_KEY=${{SSH_KEY_COMMAS}}
    - SSH_PORT=${{SSH_PORT}}
    - SPLIT_CHAR=${{SPLIT_CHAR}}
  commands:
    - transferDirectory ${{RDOCKER_HOST}} ./terraform/ ${{MEMSET_CLOUD_ROOT}}/data_to_backup/terraform/executions/${{RJM_WS_NAME}}
    - ssh -p ${{SSH_PORT}} -i ${HOME}/.ssh/id_rdocker -o StrictHostKeyChecking=no ${{RDOCKER_HOST}} ${{MEMSET_CLOUD_ROOT}}/scripts/update_terraform_deployment.sh  setup_test ${{MEMSET_CLOUD_ROOT}} ${{RJM_WS_NAME}} ${{RJM_VERSION}}
    - ssh -p ${{SSH_PORT}} -i ${HOME}/.ssh/id_rdocker -o StrictHostKeyChecking=no ${{RDOCKER_HOST}} ${{MEMSET_CLOUD_ROOT}}/scripts/update_terraform_deployment.sh  deploy ${{MEMSET_CLOUD_ROOT}} ${{RJM_WS_NAME}} ${{RJM_VERSION}}
    - ssh -p ${{SSH_PORT}} -i ${HOME}/.ssh/id_rdocker -o StrictHostKeyChecking=no ${{RDOCKER_HOST}} ${{MEMSET_CLOUD_ROOT}}/scripts/execute_terraform.sh ${{MEMSET_CLOUD_ROOT}} ${{RJM_WS_NAME}}

```

## If converting delete kong artifacts

If you are converting delete previous services, routes and upstreams from Kong.



