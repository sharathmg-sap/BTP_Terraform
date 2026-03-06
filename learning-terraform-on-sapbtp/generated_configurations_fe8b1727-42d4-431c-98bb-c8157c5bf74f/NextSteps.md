# How to Work With the Exported Configuration Files

You've successfully exported resources from a subaccount on SAP BTP using the Terraform exporter for SAP BTP (btptf CLI).

This export created Terraform configuration files and import blocks for your subaccount with ID fe8b1727-42d4-431c-98bb-c8157c5bf74f in the generated_configurations_fe8b1727-42d4-431c-98bb-c8157c5bf74f folder. You'll need these files to run '*terraform apply*' and import the state.

At export, the generated code was refined by the btptf CLI as outlined in the [documentation](https://sap.github.io/terraform-exporter-btp/tfcodeimprovements/).

However, we strongly recommend that you review the code before you execute the state import.

Here are some points to consider:

1. **Check provider version constraints**: Check the version constraint in the provider configuration (*provider.tf*) i.e. make sure that the constraints are compliant with the rules of your company like cherry-picking one explicit version. We recommend to always use the latest version independent of the constraints you add.

2. **Cleanup configuration of resources**: The configuration (*btp_resources.tf*) is generated based on the information about the resources available from the provider plugin. All data including optional data that got defaulted (e.g. usage in the btp_subaccount resource) is added to the configuration. To reduce the amount of data you could remove optional attributes that you don't want to have set explicitly.

3. **Declare variables**: The generated code already contains some variables in the *variables.tf* file. Depending on your requirements you might want to add further parameters to the variable list. For example, the name of a subaccount.

4. **Configure backend**: The state of your configuration should be stored in a remote state backend. If you have not injected an existing remote state at export (see [How to Add a Remote Backend Configuration](https://sap.github.io/terraform-exporter-btp/remotebackend/)), make sure to add the corresponding configuration in the *provider.tf* file manually. You find more details in the [Terraform documentation](https://developer.hashicorp.com/terraform/language/backend).

5. **Validate the import**: Validate that the import is possible by executing '*terraform plan*'. Depending on the number of resources, the planing should return a message like this:

    Plan: n to import, 0 to add, 0 to change, 0 to destroy.

Now you're all set to run '*terraform apply*', which will import the state and thus bring your SAP BTP resources under the management of Terraform. Congrats!

