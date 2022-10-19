# DevOps

My personal notes for learning Development Operations from the perspective of someone with good general experience with all the related topics looking to understand DevOps' tools and workflows more deeply.

## What is DevOps?

DevOps is combination of philosophies, practices, and tools used in building delivery pipelines for services and it is focused on the unification and **automation** of the deployment lifecycle. Put more plainly, DevOps is responsible for building, testing, and releasing code in an accountable way that allows parties to react more rapidly, ensures higher reliability, scales more easily and is more secure.

DevOps Cycle: Plan > Code > Build > Test (CI) > Release > Deploy (CD) > Operate > Monitor > Plan

The three pillars of DevOps are Pull Request Automation, Deployment Automation and Application Performance Management.

### Continuous Integration

During the development process, developers will propose code changes with version control tools like GitHub or GitLab. These changes are called pull requests or merge requests. The request itself is usually a fully formed feature that focuses on solving some sort of business requirement. Once this pull request is approved through a process of **Code Review**, the feature get merged into the main codebase. The DevOps engineer places gates in front of this process in order to automate the catching of bugs. This automated process is called **Continuous Integration** (CI). After the pull request is approved and validated by CI, more feedback is given by the Managers, Leads and Designers responsible for the project.

CI is the automated process of building and testing changes to a codebase each time feature branches get merged in a version controlled repository and exists to keep the momentum up for developers so they commit often and catch bugs early. Depending on the teams branch policies, commits can be done as features to a dev branch, or the main branch, depending on quality constraints. An individual developer works on a feature branch of the project, they then make a pull request to merge their feature branch into dev or main. This triggers a build system (Jenkins, TeamCity, Buddy, Gitlab CI, Circle CI) to build, test and validate the main branch with the new changes. It's important to realize CI is not QA, Quality Assurance or manual testing, is a domain in its own right, as much as Software Engineering or DevOps.

### Continuous Delivery

CD is a lean practice, where building, testing, configuration and deployment take place to make code active in a production environment. This release pipeline usually automates testing and infrastructure creation in order to deploy new builds.

Is used to perform tasks like automatically deploying builds with features to a certain set of users for testing in small groups before rolling out changes publicly - this is called **Canary Deployment** or rolling out a new version of software in a staggered way while avoiding downtime on the client's side, and even rolling back to a previous version in case something really bad happened! Ideally, we don't want to rely on too much custom code to perform these automatic deployments because that means we have more code specific to one project, more code to maintain, and more tests to write for all that new code. It makes sense to use off the shelf software.

### Application Performance Management

So now that we've done the building, testing and deployment, it would be great to have insight into the infrastructure and services so we can make changes internally in order to reduce waste and increase performance. Performance Management in DevOps falls in the following catagories:

* Metrics
  * being able to quantify factors that directly impact service delivery
* Logging
  * having an auditable history of transactions in order to debug processes
* Monitoring
  * turning metrics and logs into data that can be processed by automation
* Alerting
  * notifies concerned parties when certain monitored values meet a threshold

### Microservices

Microservice approach replaces monolithic architecture by breaking up a service into multiple smaller applications focused on clean separation of business logic that can function independently, scale more easily, and is resilient to failure. For example, we have a second hand goods app where people buy and sell their unwanted items. We can break this app down into many smaller apps dedicated to specific business functions, for instance a shopping cart and a checkout feature. If the checkout feature fails, it's much easier for the service to recover. Ideally we should want all these sub-services to be **self-contained** and not be **loosely coupled** with each other to function.

#### Messaging

A big part of making microservice function is the underlying communication between services. To achieve this we can either make use of synchronous HTTP **API calls** between endpoints defined for each service, employ what's called a **Message Broker** (RabbitMQ, Apache Kafka) that enables asynchronous communication between services, or make use of a **Service Mesh** (Kubernetes).

#### Complexity

There are downsides to using microservices architecture and that revolves around the added **complexity** involved in configuring communication between distributed services and the difficulty involved in monitoring many instances of the same service distributed across servers. There are however tools (Kubernetes, Terraform) that help make our lives as DevOps engineers easier.

#### Monorepo vs Polyrepo

The challenge of monorepos (single repository for entire project and sub-services) is that they can be difficult to keep loosely coupled and will become **bloated** with time as individual projects become more complex. Building and deploying can also become more cumbersome when many services share the same repo because if one service change breaks the main branch, other services and their pipelines won't be able build. Some companies do however use monorepo, so it should not be completely discounted for small projects.

Polyrepos on the other hand come with many of their own issues. It might be difficult or impossible to easily share or find resources across a group of repos and there is generally more overhead observed with polyrepos, but they do offer excellent separation and will result in faster build times because of smaller codebases needing to be pulled, built and tested.

### Infrastructure as Code

#### Configuration Management

#### Policy as Code

### Monitoring and Logging

### Communication and Collaboration

## DevOps Skillset

What are the technical skills needed to enter a DevOps career?

* Server Administration (On-Premise/Remote)
  * Command Line
  * Package Management
  * Users & Permissions
  * File Systems
  * Operating Systems
  * Networking
  * Virtualization
  * SSH
* Development
  * Scripting & Programming
    * Python, Java, Go, JS
    * YAML, JSON
  * Version Control
    * Git
* Infrastructure
  * Containers & Container Orchestration
    * Docker, Kubernetes
  * Cloud Iaas
    * AWS, AZURE, GCP
  * Infrastructure Provisioning
    * Terraform
* Testing & Building
  * Build Tools
    * Gradle, Maven
  * Artifact Repository Management
  * CI/CD
    * Jenkins, GitHub Actions
* Observation
  * Monitoring
    * Fluent Bit, Prometheus, Nagios
* Automation
  * Shell Scripting
  * Configuration Management
    * Ansible

## Docker

Below are my notes on learning Docker and progressing towards Kubernetes.

### Concepts

* containers
* container images
* repositories

### What is a Container?

A container is an environment within which we can run applications. As the word suggests, it `contains` the application and its dependencies. A container is portable, stateless, and offers a degree of isolation. The primary goal of containers and container technology is to speed up development and deployment processes in a reproducible and scalable manner.

### What are Container Images?

People sometimes refer to containers as images, this is technically incorrect. It is more correct to say a container is the runtime environment created from an image. These images are built with some predefined configuration. In other words, images are blueprints and collections of resources built by publishers to create containers with specific functions, like spinning up a database, for instance.

### What is a Repository?

Essentially, a repository is a place where pre-built containers exists as a collection of official or unofficial images that can be downloaded and further modified or deployed as needed. These repositories are either public or private and facilitate the storage and deployment of containers to the public or internally in the development and deployment cycle.

### Why choose containerization?

Before containerization became the norm in the application development pipeline, individual developers would often have to set up development environments on a per workstation or per office basis, this would often results in dependency issues between developers on the same project, or conflict between developers working on different projects within the same environment, or even across different operating systems. This meant that setting up an environment took longer, consumed more resources and meant maintaining a clean, reproducible environment was more difficult over longer time spans. All said; more complexity, and more 'stuff' to go wrong.

Enter containerization: With containers, we can define our environment with configuration files, build `images` for our specific use-case with start scripts, and create storage `volumes` that persist across container restarts (remember, containers are ephemeral), all while keeping our environment portable, irrespective of operating system or even storage backends. This means we have a perfectly reproducible development and deployment environment that can even have different versions of the same environment on the same system.

### Commands

Some simple commands to get started:

Check out [Docker Run Reference](https://docs.docker.com/engine/reference/run/) and [Docker Command Line Reference](https://docs.docker.com/engine/reference/commandline/docker/) for more!

* `sudo docker pull image:version`
  *  download an image called image:tag, the tag portion of the name is the version
* `sudo docker run --name container-id-123 -p 80:80 -m 512M -c 2 -d awesomeapp:latest`
  * start a docker container from the latest image of 'awesomeapp' in a detached mode
  * name the container containder-id, map the container port 80 to hosts port 80
  * limit system resource usage to 512MB memory and 2 CPU cores
* `sudo docker ps`
  * lists the active containers
* `sudo docker ps -a`
  * list all containers
* `sudo docker restart container-id-123`
  * restart container-id-123
* `sudo docker exec -it container-id-123 bash`
  * 'enter' container-id-123 by opening the interactive terminal
* `sudo docker logs container-id-123 -t 50 -n`
  * display the last 50 logs with timestamps for container-id-123
* `sudo docker update container-id-123 -m 256M --restart unless-stopped`
  * update a container's memory quota and restart policy (not available on Windows)
* `sudo docker stop container-id-123`
  * stop container-id-123
* `sudo docker rm container-id-123`
  * remove container-id-123
* `sudo docker rmi image:tag` | `sudo docker image rm image:tag`
  * remove image
* `sudo docker network prune`
  * remove orphaned networks
* `sudo docker volumes prune`
  * remove orphaned storage volumes
* `sudo docker stats` | `sudo docker container stats container-id-123`
  * display statistics for running containers
* `sudo docker top`
  * display the running processes inside a container

It's important to remember `docker run` instantiated a container from an image, `docker start` restarts a stopped container.

### Beyond The Basics

### Best Practices

* use official images
* be specific with versioning
* use the smallest image possible
* optimize build steps to reuse cached layers
* make good use of .dockerignore
* use multi-stage builds to reduce attack surface
* create a least privileged user
  * often root by default but some images have generic users
* always scan  your images for security vulnerabilities
  * log into Docker Hub and use `sudo docker scan IMAGENAME`

#### User Management at Build Time

```
# users and groups
RUN groupadd -r bob && useradd -g bob bob

# ownership and permissions
RUN chown -R bob:bob /path

# change user
USER bob

# actions to perform
CMD node index.js
```

### Docker Networks

#### Network Types

* Host
* Bridge
* ...

Docker creates isolated networks on the host system, if two docker containers are deployed within the same network, they can communicate with each other without any special considerations. When containers

* `sudo docker network create test-network`
    * creates a new network called test-network
* `sudo docker network ls`
    * lists networks available to docker

### Environment Variables

### Docker Compose 

### Dockerfile

### Private Repos

## Kubernetes

Below are my notes on learning Kubernetes.

### Why use Kubernetes?

[Kubernetes](https://kubernetes.io/docs/home/) is a container orchestration tool for managing distributed containerized workloads and services, essentially it allows us to perform [declarative configuration](https://blog.nelhage.com/post/declarative-configuration-management/) and automation of container deployment in a scalable, performant way that is easy to backup and restore. The three big ideas of Kubernetes is that it aims to offer high availability, scalability and disaster recovery.

### Concepts

* Master and Worker Nodes
  * Master Node runs Kubernetes processes to manage the cluster
    * API Server - the entrypoint to the cluster for configuration from the UI, API and, CLI
    * Configuration is done in YAML and JSON format
    * Controller Manager - manages the state of the cluster, repairs, restarts
    * Scheduler - assigns containers to pods based on container needs and resource availability
    * etcd - key-value storage that tracks the state of all nodes and containers
  * Each Worker Node contains a number of Pods, which in turn run a number of containers
  * Virtual Network
    * combines all nodes into one machine
  * Kubelets responsible for running application processes on Worker Nodes
* Pods are wrappers around container/s
  * One Pod per application, possibly many containers per pod
  * Pods are ephemeral so they can be recreated frequently
  * Each Pod has its own IP address which is renewed when it is recreated
* Service
  * Sits in front of the Pod and is not tied to the Pod's life-cycle
  * Has a permanent IP address per Pod, and acts as a load balancer

### Components

Some of the core components we'll encounter most often when working with Kubernetes.

* Node <- individual worker in a cluster
  * Ingres <- external service, load balances and redirects requests to Service
    * Service <- internal service in front of Pod
      * Pod <- wrapper (abstraction) around application containers
        * Containers <- containers needed for application
        * Data -> Volumes
  * ConfigMap <- external configuration for Pod
  * Secrets <- stores secret credentials for Pod
  * Volumes <- persistent storage for the Pod
  * Deployment <- blueprint (abstraction) for Pod (stateless) configuration
  * StatefulSet <- needed to manage (stateful) apps like databases

### Architecture

Let's take a look at the architecture behind Kubernetes, for this example let's imagine we have one Worker Node with 2 Application Pods running on it.

* Node <- our clustered servers being controlled by the Master Node
  * Multiple Pods <- collections of containers as individual apps
  * Container Runtime <- Docker or similar container technology
  * Kubelet <- Kubernetes process interfaces with container runtime and node machine to start pods
  * Kube Proxy <- intelligently forwards requests from services to pods

* Master Node <- different processes than Worker Nodes
  * Api Server <- gateway that validates requests and queries to the cluster
  * Scheduler <- looks at requests, checks resource availability, and assigns pods to nodes
    * The Pod then gets started by Kubelet
  * Controller Manager <- Detects state changes, attempts recovery via Scheduler
  * etcd <- Stores state of the cluster for the purposes of communication between processes

Small Cluster Example:

Provisioning masters and workers in Kubernetes to extend existing clusters is relatively easy and only requires that their respective processes be satisfied in order for new servers to be added to the cluster.

* Master 1
  * Node 1
  * Node 2
* Master 2
  * Node 3

### Minikube & Kubectl

Minikube is a condensed Kubernetes cluster meant to run on a single machine for development and testing purposes. The Master and Worker Node processes are all present on a single machine. Kubectl is a powerful command-line tool for K8s cluster and allows us to make requests to master processes through the API Server.

### K3s vs K8s?

[K3s](https://github.com/k3s-io/k3s) is a lightweight, production ready distribution of Kubernetes tailored for edge computing and low power devices and has proven useful for IoT, CI, Development, ARM, and Edge computing.

### Kubectl Commands

* `kubectl get pod`
  * list the status of all pods on the node
* `kubectl get services`
  * show services on node
* `kubectl create deployment NAME --image=image [--dry-run] [options]`
  * create a deployment configuration
* `kubectl get deployment`
  * shows deployments created on node
* `kubectl edit deployment NAME`
  * directly edit the pod's auto generated config file
* `kubectl logs NAME`
  * shows log output associated with the pod
* `kubectl describe pod NAME`
  * reports on state changes inside the pod
* `kubectl exec -it NAME -- bin/bash`
  * 'enter' container NAME by opening the interactive terminal
* `kubectl delete deployment NAME`
  * delete the deployment configuration
* `kubectl apply -f config-file.yaml`
  * executes the configuration file
* `kubectl delete -f config-file.yaml`
  * delete pod using the configuration file
* `kubectl get ns`
  * show all namespaces associated with the cluster
* `kubectl get all -n NAMESPACE`
  * shows all components associated with a given namespace

### YAML Refresher

https://www.youtube.com/watch?v=1uFVr15xDGg

### Deployment Configuration

Below is a deployment blueprint for creating a pod in YAML format. Configuration files have three parts, the metadata, the specification, and the status. The status is automatically generated by Kubernetes, it is what gets checked by the Controller Manager in order to confirm the declared desired state and the actual state remain equivalent.

Templates have their own specification data and metadata which applies to a pod. This can be seen as the blueprint for the pod (images, ports, names). The chain of responsibility is as follows: Deployments manage Replica Sets which manage Pods which are an abstraction of containers.

In the metadata we use labels and selectors, which are simply key-value pairs, to register pods with specific services. Ports are broken down into a service port and a pod port, or external and internal, with the internal container port being the targetPort and the external port being what is managed by Services, it's important to note that we don't pass ports to the outside, Ingest performs redirects to Services.

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: test-namespace
  labels:
    app: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.16
          ports:
            - containerPort: 8080
```

### Namespaces

In Kubernetes a namespace is a way to organize clusters into virtual sub-clusters, this is useful when different teams are sharing resources in a cluster and the teams need logical separation but still need to inter-communicate. It is also extremely useful in staging/deployment or blue/green deployment configurations because it allows us to assign and reuse resources with quotas. K8s gives us 4 namespaces by default.

* kube-system
  * system processes, not for user to deploy in
* kube-public
  * publicly accessible cluster info that doesn't need auth
* kube-node-lease
  * holds info about node heartbeats (availability)
* default
  * the namespace available to the user for deployment
  
These defaults can be appended to with any number of user generated namespaces. Namespaces can be generated from the CLI with `kubectl create namespace NAME`, but it is considered good practice to declare namespaces via a configuration file so your deployment's history can be audited.

Some limitations of namespaces are:

* We can't access most resources from other namespaces (needs individual ConfigMap)
* Secrets must be declared in each namespace
* Sharable resources are services which need to be declared in ConfigMap as `service.namespace`
* Some components are not isolatable in namespaces, for instance volumes because they live globally on the cluster
* If you don't supply a namespace, components get created in the `default` namespace

### Ingress & Ingress Controller

Let's suppose there exists an amazing-app pod, this pod has an amazing-app service in front of it that receives redirected requests from [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/).

Request -> Ingress -> Service -> Pod

While using ingress is the preferred method for handling requests, it is possible to perform external service mapping to internal services as follows.

Example: External Service configuration

```yml
apiVersion: v1
kind: Service
metadata:
  name: amazing-app-external-service
spec:
  selector:
    app: amazing-app
  type: LoadBalancer
  ports:
    - protocols: TCP
      port: 8080
      targetPort: 8080
      nodePort: 55000
```

Using ingress allows us to apply rules for forwarding and routing to our internal services and is what handles load balancing, SSL termination and name-based virtual hosting. In the below specification we have the most basic configuration to allow HTTP routing to our internal service.

Example: Ingress configuration

```yml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: amazing-app-ingress
spec:
  rules:
    - host: amazing-app.com # must be a valid domain
      http: # not related to http in the browser
        paths: # everything after the tld /..
        - backend:
            serviceName: amazing-app-internal-service
            servicePort: 8080
```

Example: Internal Service configuration

```yml
apiVersion: v1
kind: Service
metadata:
  name: amazing-app-service
spec:
  selector:
    app: amazing-app
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
```

There are many third party implementations of the Ingress Controller and most Cloud Service Providers have solutions that tie into K8s, if deploying on bare-metal the responsibility will fall on you to set up a entry point (proxy) to the cluster that will act as a load balancer. In this scenario you will have a separate server with a public IP and open ports acting like a entrypoint to the cluster.

### Ingress Rules

Example: namespace-ingress

```yml
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: namespace-ingress
  namespace: namespace
spec:
  rules:
  - host: domain.tld
    http:
      paths:
      - backend:
          serviceName: namespace
          servicePort: 80
```

We can apply the configuration file with `kubectl apply -f namespace-ingress.yaml` and check the state of ingress by issuing `kubectl get ingress -n namespace-ingress`. It is possible to specify multiple paths for the same host, for example we have a master domain with many separate applications that live under that domain. For instance: awesome-app.com, we can introduce `-path: /reports`, to point to a report service, our resulting route when then be: `awesome-app.com/reports`.

### Services

https://www.youtube.com/watch?v=T4Z7visMM4E

### Helm

https://www.youtube.com/watch?v=-ykwb1d0DXU

### App Deployment Demo

https://www.youtube.com/watch?v=EQNO_kM96Mo

### Pods & Containers

https://www.youtube.com/watch?v=5cNrTU6o3Fw

### Volumes

https://www.youtube.com/watch?v=0swOh5C3OVM

### ConfigMap

https://www.youtube.com/watch?v=FAnQTgr04mU

### StatefulSet

https://www.youtube.com/watch?v=pPQKAR1pA9U

### Private Docker Registry Pulls

https://www.youtube.com/watch?v=asIS4KIs40M

## Ansible

Below are my study notes on Ansible, the basic principles of how it operates, its syntax, and some common use cases as examples. My notes are not meant to be exhaustive, just something I can refer back to if I need a refresher. If you'd like to learn Ansible, I can recommend the [Documentation](https://docs.ansible.com/) and the excellent book, [Ansible for DevOps](https://www.ansiblefordevops.com/).

### Use Cases

* Application Deployment
* Configuration Management
* Orchestration
* Security and Compliance
* Provisioning

When deciding to use **Terraform vs Ansible**, a few key points to consider are:

* Terraform's strengths lay in infrastructure provisioning
  * Declarative in nature
  * Can't do bare-metal provisioning
  * Orchestrating cloud services and cloud infrastructure: virtual machines, containers, storage and networking.
* Ansible's strengths are in configuration management
  * Procedural in nature
  * Can do bare-metal provisioning
  * Configuring servers: provisioning, config management, app deployment. Works on Windows, Unix, Linux.

## Architecture Overview

* **Control Node**
    * Our master machine, from which all managed processes will be orchestrated.

* **Configuration Management Database**
  * Central Data Warehouse for Configuration and Data Assets
  * Repository for all Configuration Management Data

* [**Inventory**](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#intro-inventory)
  * A list of all the IP addresses and hostnames of your managed/target machines, also called a 'hostfile'.

* [**Playbook**](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html#about-playbooks)
  * **Plays**
    * A simple file written in YAML code that describes the workflows (plays) required to perform certain tasks on your inventory
      * API's exists to support modules and are not for direct consumption (Python, Cloud Services, Etc.)
      * Capable of synchronous and asynchronous execution

  * [**Modules**](https://docs.ansible.com/ansible/latest/collections/index.html#list-of-collections) exist within every playbook, and is composed of code executed on our target machines

  * [**Plugins**](https://docs.ansible.com/ansible/latest/plugins/plugins.html#working-with-plugins) allow us to execute ansible tasks as a job build step and augment ansible's core functions

  * **Roles**
    * Reusable tasks, handlers, variables, plugins, templates and files inside a Play

  * **Tasks**
    * Actioned constrained to a Play that can be applied to a host

  * **Handlers**
    * Special tasks that only execute when notified by a state change in a previous task

* **Managed Nodes**
  * Targets or hosts to be managed by Ansible

* [**Collections**](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html#collections)
  * A format in which ansible content is distributed

* Ansible Galaxy
  * a free site for finding community made roles and collections, a collection being an automation package that includes multiple playbooks, roles, modules and plugins

## Installing Ansible (Fedora)

```bash
# update and upgrade your package manager, make sure Pipenv is installed
sudo dnf check-cache
sudo dnf upgrade
# install pipenv through DNF or PIP3
sudo dnf install pipenv
pip3 install pipenv
# move to your directory of choice and create a virtual environment to run ansible
pipenv install ansible
# to run ansible commands, simply do:
pipenv run ansible-playbook --inventory-file inventory.ini playbook.yml -u root --ask-pass
```

## Playbook Structure

* Playbooks are written in [YAML](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html#yaml-syntax)
* They contain lists, key-value pairs, and list of dictionaries
* Start with three dashes and ends with three dots
* Hosts are the group of target machines defined in our inventory/hostfile
* Tasks are executed strictly in order, but can be asynchronous or synchronous across hosts
* Handlers are executed as triggers to state changes in the list of tasks

```yml
---
name: what the playbook will be doing
hosts: tells ansible on which nodes to run the tasks
vars: lets you define variables available to your playbook
tasks: the actions that are going to be performed --> links internally to modules
...
```

### A Playbook Terminology Primer

For more in-depth content on the topics below, see: [Ansible User Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)

* Escalate privileges and change users with `become`
* Repeat tasks with `loops`
* Execute tasks on different machines with `delegate`
* Run tasks when certain conditons are met with `conditionals`
* Evaluate conditions with `tests`
* Group tasks together with `blocks`
* React to changes with `handlers`
* Set remote `environment values`
* Create reusable `files` and `roles`
* Use playbooks in other playbooks with `include` and `import`
* Run only parts of a playbook with `tags`
* Run a playbook against various systems with different requirements with `variables`
* Retrieve information about inventory with `facts`
* Store sensitive information with `vault`
* Test run playbooks with `check mode` and `diff`
* Verify playbooks before executing them with `ansible-lint`

### Playbook Examples

For more examples, see: [Ansible Examples](https://github.com/ansible/ansible-examples)

playbook with two plays (tasks): update webservers and update databases
```yml
---
- name: Update web servers
  hosts: webservers
  remote_user: root

  tasks:
  - name: Ensure apache is at the latest version
    ansible.builtin.yum:
      name: httpd
      state: latest
  - name: Write the apache config file
    ansible.builtin.template:
      src: /srv/httpd.j2
      dest: /etc/httpd.conf

- name: Update db servers
  hosts: databases
  remote_user: root

  tasks:
  - name: Ensure postgresql is at the latest version
    ansible.builtin.yum:
      name: postgresql
      state: latest
  - name: Ensure that postgresql is started
    ansible.builtin.service:
      name: postgresql
      state: started
...
```

playbook with one play (task): provisioning an Amazon EC2 instance
```yml
---
- name: Create an EC2 instance
  hosts: web
  gather_facts: false

  vars:
    region: us-east-2
    instance_type: t2.micro
    ami: ami-00000000000001
    keypair: abcdefg

  tasks:
    - name: Create an EC2 instance
      ec2:
        aws_access_key: '***********************'
        aws_secret_key: '***********************'
        key_name: "{{ keypair }}"
        group: launch-wizard-00
        instance_type: "{{ instance_type }}"
        image: "{{ ami }}"
        wait: true
        region: "{{ region }}"
        count: 1
        vpc_subnet_id: subnet-00000000000001
        assign_public_ip: yes
    register: ec2
...
```

## Inventory Structure

The default path to the inventory is located at: `/etc/ansible/hosts`, but if you're working with **Pipenv**, you can pass your inventory file to ansible via the `--inventory-file inventory.yml` flag. The format of an inventory file can be in either .yml or .ini syntax, where the name of the group is enclosed in brackets and the server dns names or ip addresses are listed below each group. We can verify our hosts by doing `ansible all --list-hosts` or `ansible --inventory-file inventory.ini --list-hosts`. Let's take a peek at how to [build out an inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#intro-inventory). Not all strings are [valid variable names](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#valid-variable-names), for instance hyphenated and dot casing is not supported, neither are names that start with numbers or keywords from Python, or your Playbook.

### Inventory Examples

inventory file in .ini format
```ini
[webservers]

    # non-standard ssh port as host variable
    server.local:222 ansible_connection=ssh ansible_user=username ansible_ssh_private_key_file=/path/to/keyfile/.ssh/keyfile

[appservers]

    192.168.0.111
    foo.example.com
    bar.example.com

[master]

    localhost ansible_connection=local
    jumpbox ansible_port=5555 ansible_host=123.123.123.50

[production]

    foo.example.com
    production_1.example.com

[production:vars]
    # variables usable by the entire group of production machines
    proxy=proxy.prod.example.com
    database=db.prod.example.com

# Never have production and staging in the same inventory, by the way
[testing]

    bar.example.com
    testing_1.example.com
    # adds a range of hosts, incremented by 2
    testserver_[01:50:2].example.com
```

inventory file in .yml format
```yml
all:
  hosts:
  children:
    webservers:
      hosts:
        # non-standard ssh port as host variable
        server.local:222 
          ansible_connection: ssh
          ansible_user: username
          ansible_ssh_private_key_file: /path/to/keyfile/.ssh/keyfile
    appservers:
      hosts:
        192.168.0.111:
        foo.example.com:
        bar.example.com:
    master:
      hosts:
        localhost:
          ansible_connection: local
        jumpbox:
          ansible_port: 5555
          ansible_host: 123.123.123.50
    production:
      hosts:
        foo.example.com:
        production_1.example.com:
      # variables usable by the entire group of production machines
      vars:
        proxy: proxy.prod.example.com
        database: db.prod.example.com
    # Never have production and staging in the same inventory, by the way
    testing:
      hosts:
        bar.example.com:
        testing_1.example.com:
        # adds a range of hosts, incremented by 2
        testserver_[01:50:2].example.com:
```

## Modules

Modules are executable portions of code that can be invoked on either the command line or included in a playbook. Below we run some ad-hoc commands from the command-line.

```bash
# Pings all defined hosts
ansible all -m ping

# Executes ls on all webservers
ansible webservers -m command -a "ls"

# Executes 'iptables -F' on all hosts with escalated privileges
ansible -i inventory all -m command -a "iptables -F" --become --ask-become-pass

# To gather information on all hosts
ansible all -m setup
```

## Roles

Roles in Ansible, is an abstraction used to organize Playbooks. They provide a skeleton for independent and reusable collections of variables, tasks, files or modules which can automatically be loaded into a Playbook. In less technical language, roles are instructions that perform specific tasks within our Playbook. We can create roles with 'Ansible-galaxy'.

```bash
# Syntax:
ansible-galaxy init roleIdentifier
```

### Roles Directory Structure

Creating a role is done using the ansible-galaxy tool to initialize the role and its folder structure.As you can see below, Ansible Roles have a specific directory structure:

```bash
sudo ansible-galaxy init rolename
```

```bash
rolename      # The directory created for our role
├── defaults  # default variables for this particular role
├── files     # files that need to be deployed to the host related to this role
├── handlers  # handlers for this role
├── meta      # metadata that establish role dependencies
├── README.md # our documentation for this role
├── tasks     # contains list of tasks related to this role (also contains main.yml)
├── templates # files that can be modified and added to the host (uses Jinja2)
├── tests     # tests for this role
└── vars      # where we store our variable files related to this role
```

### Role Examples

We can then create our `main.yml` file inside the role's tasks folder and make use of the role in a playbook, in this case `simpleroles.yml`.

rolename/tasks/main.yml
```yml
---
- name: Install GIT
  apt:  # <-- Here we use the APT module to install git
    name: git
    state: present
    update_cache: yes
...
```

/path/to/playbook/simpleroles.yml
```yml
---
- hosts: all
  become: true
  vars:
    ansible_become_pass: ourpassword
    var_node: /tmp
  roles:
    - rolename  # Here we've imported the role to be executed on all hosts
...
```

## Jenkins

### Local Setup with Docker

* `sudo docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts`
  * deploy a jenkins docker container with a persistent volume and ports open on 8080 and 50000.
* `sudo docker ps`
  * get the newly created container id
* `sudo docker logs CONTAINER ID`
  * get the initial setup password from the container's logs
* browser: `localhost:8080`
  * unlock jenkins with the setup password
  * perform initial setup and install plugins
  * create admin user

### Concepts

* Items
  * Freestyle Project - Single tasks like testing
  * Pipeline - more complex delivery flows (test, build, package, deploy) single branch
  * Multibranch Pipeline - applies to multiple branches
* Credential Scopes
  * System
  * Global

https://www.youtube.com/watch?v=MY1w7sWW5ms

## Terraform

## GitOps

### Summary

Scenario: Our Development team has created a bespoke Hello World app and is ready to put it into production. The app has its own CI/CD pipeline that pushes images to `AWS ECR` on a regular basis. The DevOps team has been tasked with configuring the cloud infrastructure needed to deploy the app to production. We're a small team, so we leverage automation and managed services. We will make use of `Terraform` to provision a `Kubernetes` cluster on `AWS EKS`. We'll also be deploying `Fluent Bit` to the cluster for logging purposes.

### Overview

* this repo contains all configuration needed to deploy our app to `AWS EKS`
  * 2 branches, `main` and `develop`
* develop
  * `github actions` performs Continuous Integration every time a pull request is merged with `develop`
* main
  * `github actions` notifies `jenkins` to trigger a build and pushes changes to production

### Why GitOps?

With GitOps the overarching goal is to approach DevOps with the same processes used in Software Development in order to produce high quality, automated, and tested Infrastructure as Code.

* Repo
  * We create a repository for our IaC configuration code which is our single source of truth
    * Terraform, Kubernetes, Fluent Bit configuration files
* Commit
  * Team members propose changes by generating pull requests on the development branch
    * CI pipeline tests commits before they get manually approved for merger to development branch
* Merge
  * Team Leads approves commits and merges changes to main branch
* Deploy
  * CD pipeline deploys changes to production
    * Push Deployments from the repo to the environment with a build application (Jenkins, GitLab) outside the environment
    * or Pull Deployments from the repo to the environment with an agent (Flux, Argo) that sits inside the environment

.

https://learn.hashicorp.com/tutorials/terraform/eks?in=terraform/kubernetes