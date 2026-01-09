@echo off

@REM Define the path toward terraform (installed with terraform)
SET  INFRACOST_TERRAFORM_BINARY=C:\ProgramData\chocolatey\bin\terraform.exe

@REM Plan terraform deploy
@REM terraform plan -out=tfplan.binary
@REM IF %ERRORLEVEL% NEQ 0 (
@REM   echo Terraform plan failed
@REM   exit /b 1
@REM )

@REM Run Infracost to generate a cost estimate
@REM To use this tool, you must have an Infracost account
@REM and configure the INFRACOST_API_KEY
@REM To do so, run:
@REM   infracost auth login
@REM   infracost configure set api_key <API_KEY>
@REM infracost breakdown --path tfplan.binary --format table
@REM IF %ERRORLEVEL% NEQ 0 (
@REM   echo Infracost failed
@REM   exit /b 1
@REM )

@REM Run terraform deploy
@REM terraform apply -auto-approve
@REM IF %ERRORLEVEL% NEQ 0 (
@REM   echo Terraform apply failed
@REM   exit /b 1
@REM )

@REM Destroy deploy
terraform destroy -auto-approve
IF %ERRORLEVEL% NEQ 0 (
  echo Terraform apply failed
  exit /b 1
)


echo.
echo Done!
