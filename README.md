# Example: How to share code between actors

## How to use

- You can place all your share code to share folder.
- In each of your actor you need to add dependency to this shared package to package.json
```
{
	...
	"dependencies": {
		...
		"shared": "./shared-1.0.0.tgz"
		...
	},
	...
}
```
- After that you need to rebuild shared package into all of your actors, using command `./rebuild_shared.sh` in root of repo.
This commmand run bash script which rebuild shared into all of your actors.
- After change in your code in shared you have to rebuild shared using `./rebuild_shared.sh` again.
- NOTE: You have to commit `shared-1.0.0.tgz` into git if you want to have shared into actor on Apify platform.
