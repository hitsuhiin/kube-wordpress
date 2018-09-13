###Wordpress Deployment using Google Kubernetes Engine


First, you must install Google Cloud Engine SDK. Please refer to [text link](https://cloud.google.com/sdk/install)
Then you must create project. Please refer to [text link](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
Create key and download key.. Please refer to [text link](https://cloud.google.com/sdk/docs/authorizing)

This setuop use Google Kubernetes Engine

To initialize blog cluster

Run
`./blog-up.sh (google-cloud-key-json-file)`
enter cluster name and mysql password

Example
`./blog-up.sh project-1224234.json`

After finished initialize, will have message that say the address of the blog.


To Resize baseline capacity run
`./blog-resize.sh (numberofreplica)`
Example
`./blog-resize.sh 5`

If you want to clean the cluster, just run
`./clean.sh`

enter the cluster name


