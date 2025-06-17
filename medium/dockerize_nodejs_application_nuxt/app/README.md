# Challenge: Dockerize a Nuxt Application

A simple Nuxt application bootstrapped with `npx nuxi@latest init`.

## Getting Started

First, run the development server:

```sh
npm run dev
```

Then publish the port `3000` and open the generated URL.

## Using Docker

First, build the image with:

```sh
npm run docker:build
```

Then run it with:

```sh
npm run docker:run
```

The above command starts a production build of the container and publishes its port `3000`.