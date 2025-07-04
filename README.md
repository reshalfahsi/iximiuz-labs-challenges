# iximiuz Labs Challenges

Solutions to iximiuz Labs Challenges

## Easy

### Linux

- [Ensure a Graceful Termination for a Containerized Node.js Application](./easy/graceful_termination_for_nodejs_container)
- [Install Docker Engine on Debian](./easy/install_docker_engine_on_debian)
- [Install Docker Engine on Fedora](./easy/install_docker_engine_on_fedora)
- [Install Docker Engine on Ubuntu](./easy/install_docker_engine_on_ubuntu)
- [Limit CPU and Memory Usage of a Linux Process](./easy/limit_cpu_and_memory_of_linux_process)
- [Linux Storage: Mount a Drive and Read Its Contents](./easy/storage_simple_mount)
- [Linux Storage: Format a Drive with Ext4 Filesystem](./easy/storage_simple_format)

### Containers

- [Build and Publish a Container Image With Docker](./easy/build_and_publish_container_image_with_docker)
- [Copy a Container Image from One Repository to Another with Docker](./easy/copy_container_image_from_one_repository_to_another_with_docker)
- [Copy Files To/From a Running Docker Container](./easy/copy_files_to_from_container)
- [Docker 101: Override Default Container Commands and Arguments](./easy/docker_101_container_run_override_command)
- [Docker 101: Run a Container in Background, Read Logs, and Attach](./easy/docker_101_container_run_in_background)
- [Docker 101: Run Your First Container](./easy/docker_101_container_run)
- [Edit a File in a Running Container: a Simple Case](./easy/edit_file_in_running_container)
- [Label a Container Image Using ctr](./easy/labeling_container_images_with_ctr)
- [Pull Container Images Using ctr](./easy/pulling_container_images_with_ctr)
- [Start and Inspect a Container With contaiNERD CTL (nerdctl)](./easy/start_container_with_nerdctl)
- [Start and Inspect a Container With Docker](./easy/start_container_with_docker)
- [Start and Inspect a Container With Podman](./easy/start_container_with_podman)
- [Tag and Push Container Images Using ctr](./easy/pushing_container_images_with_ctr)
- [Working With containerd Namespaces](./easy/containerd_namespaces)

### Kubernetes

- [Copy Files To/From a Running Kubernetes Pod: a Simple Case](./easy/copy_files_to_from_kubernetes_pod)
- [Deploy a Resource-Greedy Pod Without Breaking the Kubernetes Cluster](./easy/start_pod_with_limited_resources)
- [Send a Signal to a Kubernetes App: a Simple Case](./easy/kubernetes_signal_container)

### Networking

- [Classic Sysadmin Task: Which Port Is a Service Listening On?](./easy/linux_find_port_used_by_service)
- [Classic Sysadmin Task: Which Process Is Listening on a Port?](./easy/linux_find_process_using_port)
- [Create a Linux Network Namespace](./easy/create_a_linux_network_namespace)
- [Forward a Port Using The Multipurpose Relay Tool: socat](./easy/forward_a_port_using_the_multipurpose_relay_tool_socat)
- [Linux Networking: Route Traffic Between Two Private Networks](./easy/networking_configure_basic_routing)

### CI/CD

- [Create Your First Dagger Module](./easy/create_first_dagger_module)
- [Install the Dagger CLI on a Linux Host](./easy/install_dagger_on_linux)

## Medium

### Containers

- [Extract the Filesystem of a Container Image](./medium/extract_container_image_filesystem)
- [Install and Configure containerd on a Linux Host](./medium/install_and_configure_containerd)
- [Start and Inspect a Container With containerd CLI - ctr](./medium/start_container_with_ctr)
- [When a FROM scratch Container Image Is Not Good Enough](./medium/when_from_scratch_image_is_not_good_enough)

### Kubernetes

- [Diagnose and Resolve Stability Issues in a Go Application Deployment](./medium/fix_go_app_container_oom)
- [Kubernetes Pod With a Faulty Init Sequence](./medium/kubernetes_pod_with_faulty_init_sequence)
- [Kubernetes Pod With a Sleepy Init Sequence](./medium/kubernetes_pod_with_sleepy_init_sequence)
- [Send a Signal to a Kubernetes App: a Slim Container Case](./medium/kubernetes_signal_slim_container)

### Networking

- [Access a Docker Container With No Published Ports](./medium/access_docker_container_with_no_published_ports)
- [Connect Two Network Namespaces](./medium/connect_two_network_namespaces)
- [Forward a Port Using the Hackers' Swiss Army Knife: netcat](./medium/port_forwarding_using_netcat)
- [Set Up Network Address Translation (NAT) for a Container](./medium/set_up_nat_for_container)
- [What Port Does This Kubernetes Pod Listen On?](./medium/kubernetes_what_port_this_pod_listens_on)

### Programming

- [Build a Production-Ready Go Container Image: A Statically Linked Application](./medium/dockerize_golang_application_static_linking)
- [Build a Production-Ready Node.js Container Image: Next.js Application](./medium/dockerize_nodejs_application_nextjs)
- [Build a Production-Ready Node.js Container Image: Nuxt Application](./medium/dockerize_nodejs_application_nuxt)
- [Build a Production-Ready Node.js Container Image: SvelteKit Application](./medium/dockerize_nodejs_application_svelte_kit)

### CI/CD

- [Write a Dagger Function to Build a Go Project](./medium/write_first_dagger_function)
- [Write a Dagger Function to Test a Go Project](./medium/write_dagger_function_to_test_go_project)

## Hard

### Kubernetes

- [Copy Files To/From a Running Kubernetes Pod: a Distroless Image Case](./hard/copy_files_to_from_distroless_kubernetes_pod) (**UNSOLVED - NEED HELP!!!**)
- [Edit a File in a Running Kubernetes Pod: a Tricky Case](./hard/edit_file_in_running_kubernetes_pod) (**UNSOLVED - NEED HELP!!!**)
- [Make a Kubernetes Pod Survive an OOM Event Without Restarting](./hard/make_kubernetes_pod_outlive_oom_event)
- [Send a Signal to a Kubernetes App: a Non-Root Container Case](./hard/kubernetes_signal_non_root_container)

### Networking

- [Connect Multiple Network Namespaces](./hard/connect_multiple_network_namespaces)
- [Forward a Port Without Starting a Proxy Process](./hard/port_forwarding_without_proxy)
- [Network Access to a Container Started by ctr](./hard/access_containerd_container_with_no_published_ports)
- [Reproduce a Docker Bridge Network Using Basic Linux Commands](./hard/reproduce_docker_bridge_network)

### Programming

- [Build a Production-Ready Go Container Image: A Dynamically Linked Application](./hard/dockerize_golang_application_dynamic_linking)
- [Build a Production-Ready Python Container Image: FastAPI Application](./hard/dockerize_python_application)