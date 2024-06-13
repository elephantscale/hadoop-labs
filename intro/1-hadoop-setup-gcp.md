# Hadoop setup on GCP
* Setting up a Hadoop cluster on Google Cloud Platform (GCP) and allowing your colleagues to access it involves several steps. I'll guide you through a high-level process to achieve this:

1. **Google Cloud Setup**:
    - **Create a Project**: Open the [GCP Console](https://console.cloud.google.com/) and create a new project.
    - **Enable Billing**: Link a billing account to your project.
    - **Enable APIs**: Enable the necessary APIs such as Compute Engine and Dataproc.

2. **Create a Hadoop Cluster Using Dataproc**:
    - Dataproc is a managed Hadoop service provided by Google Cloud.
    - Navigate to `Dataproc` > `Clusters` in the GCP console.
    - Click on `Create Cluster`.
    - Configure the cluster as per your needs (like region, number of nodes, machine types, etc.).
    - Click on `Create` to launch the cluster.

3. **Set up IAM Roles and Permissions**:
    - For colleagues to access the cluster, they need appropriate permissions.
    - Navigate to `IAM & Admin` in the GCP console.
    - Click `Add` to add a new member (You can use their Google email addresses).
    - Assign appropriate roles. For Dataproc access, you might give roles like `Dataproc Editor` or `Dataproc Viewer`, depending on what access level you want to provide.

4. **SSH Access to Cluster**:
    - If your colleagues need SSH access, you'd need to manage SSH keys.
    - Each colleague can generate an SSH key pair (using `ssh-keygen`) if they don't already have one.
    - They can then share the public key with you.
    - Add each public key to the Compute Engine's metadata to provide SSH access. This can be done in `Compute Engine` > `Metadata` > `SSH Keys`.

5. **Accessing Hadoop**:
    - Once SSH access is granted, your colleagues can SSH into the master node of the Hadoop cluster.
    - They can then run Hadoop commands using the `hadoop` command-line tool.

6. **Setting up Hadoop UI Access**:
    - Hadoop offers web-based UIs for monitoring (ResourceManager and HDFS among others).
    - To securely access these UIs, set up an SSH tunnel and use SOCKS proxy.
    - Your colleagues can create an SSH tunnel with a command like:
      ```
      ssh -i [PRIVATE_KEY_PATH] -D 1080 -q -C -N [USERNAME]@[MASTER_NODE_IP]
      ```
    - After setting up the tunnel, they can configure their browser to use a SOCKS proxy with `localhost:1080` to access the Hadoop UIs.

7. **Clean Up**:
    - Remember to shut down resources when they're not in use to avoid unnecessary charges. You can delete the Dataproc cluster if it's not required. Resources in GCP are billable, so it's essential to monitor and manage them efficiently.

Remember, setting up and managing a Hadoop cluster requires careful consideration of security practices. Always follow best practices, such as limiting access to only necessary personnel, regularly reviewing permissions, and securing data at rest and in transit.