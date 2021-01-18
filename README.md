# Create Tables and data in SQL Server

This project create tables and data in a sql server database.
## database.env
Set the environment variables like:
| Parameter | Description |
| ------ | ------ |
| ACCEPT_EULA=Y | Set the ACCEPT_EULA variable to any value to confirm your acceptance of the End-User Licensing Agreement. Required setting for the SQL Server image. |
| SA_PASSWORD | Specify your own strong password that is at least 8 characters and meets the SQL Server password requirements. Required setting for the SQL Server image. |

## Params
| Parameter | Description |
| ------ | ------ |
| user | The **SA** account is a system administrator on the SQL Server instance that gets created during setup. |
| port | The port mapped is **1433** in your container. In this example, that is the same port, 1433, on the host machine |

## Run
```sh
$ docker-compose up
```

## References
[Run SQL Server container images with Docker](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash)
