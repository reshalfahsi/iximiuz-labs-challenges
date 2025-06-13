# **Install the Dagger CLI on a Linux Host**

Installing Dagger on a Linux machine is a straightforward task. Simply follow the [official instructions](https://docs.dagger.io/install/) to complete this challenge, but make sure to install the CLI to one of the existing PATH locations.

Once the CLI installation is complete, the automation of the playground will try putting it to use. It will trigger the initialization of the Dagger Engine, which might take a minute or two due to the cold start.

> The Dagger Engine is conveniently distributed as a container image, which is pulled and started by the Dagger CLI during the first run.
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/install-dagger-on-linux/__static__/dagger-simplified.png" width="400" alt="dagger-simplified" > </p>
> Keep an eye on the outputs of ``docker images`` and ``docker ps`` while waiting for the task below to complete.

## **Source**

[Install the Dagger CLI on a Linux Host](https://labs.iximiuz.com/challenges/install-dagger-on-linux)

## **[Back to Home](../../)**