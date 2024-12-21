---
title: "Halo Overview"
sidebar_position: 2
---

Read this page to gain a high-level understanding of Halo and concepts you will need to know to build your application.

## Architecture

Halo is a headless e-commerce platform. By "headless" we mean that it exposes all of its functionality via APIs. Specifically, Halo features two GraphQL APIs: one for storefronts (Shop API) and the other for administrative functions (Admin API).

These are the major parts of a Halo application:

* **Server**: The Halo server is the part that handles requests coming in to the GraphQL APIs. It serves both the [Shop API](/reference/graphql-api/shop/queries) and [Admin API](/reference/graphql-api/admin/queries), and can send jobs to the Job Queue to be processed by the Worker.
* **Worker**: The Worker runs in the background and deals with tasks such as updating the search index, sending emails, and other tasks which may be long-running, resource-intensive or require retries.
* **Admin UI**: The Admin UI is how shop administrators manage orders, customers, products, settings and so on. It is not actually part of the Halo core, but is provided as a plugin (the [AdminUiPlugin](/reference/core-plugins/admin-ui-plugin/)) which is installed for you in a standard Halo installation. The Admin UI can be further extended to support custom functionality, as detailed in the [Extending the Admin UI](/guides/extending-the-admin-ui/getting-started/) section
* **Storefront**: With headless commerce, you are free to implement your storefront exactly as you see fit, unconstrained by the back-end, using any technologies that you like. To make this process easier, we have created a number of [storefront starter kits](/guides/storefront/storefront-starters/), as well as [guides on building a storefront](/guides/storefront/connect-api/).

![./Vendure_docs-architecture.webp](./Vendure_docs-architecture.webp) 

## Technology stack

Halo is built on the following open-source technologies:

- **SQL Database**: Halo requires an SQL database compatible with [TypeORM](https://typeorm.io/). Officially we support **PostgreSQL**, but Halo can also be used with API-compatible variants such [Amazon Aurora](https://aws.amazon.com/rds/aurora/), [CockroachDB](https://www.cockroachlabs.com/), or [PlanetScale](https://planetscale.com/).
- **TypeScript & Node.js**: Halo is written in [TypeScript](https://www.typescriptlang.org/) and runs on [Node.js](https://nodejs.org).
- **NestJS**: The underlying framework is [NestJS](https://nestjs.com/), which is a full-featured application development framework for Node.js. Building on NestJS means that Halo benefits from the well-defined structure and rich feature-set and ecosystem that NestJS provides.
- **GraphQL**: The Shop and Admin APIs use [GraphQL](https://graphql.org/), which is a modern API technology which allows you to specify the exact data that your client application needs in a convenient and type-safe way. Internally we use [Apollo Server](https://www.apollographql.com/docs/apollo-server/) to power our GraphQL APIs.
- **Angular**: The Admin UI is built with [Angular](https://angular.io/), a popular, stable application framework from Google. Note that you do not need to know Angular to use Halo, and UI extensions can even be written in the front-end framework of your choice, such as React or Vue.

## Design principles

Halo is designed to be:

- **Flexible**: Halo is designed to be flexible enough to support a wide range of e-commerce use-cases, while taking care of the common functionality for you. It is not a "one-size-fits-all" solution, but rather a framework which you can extend and customize to suit your needs.
- **Extensible**: A typical e-commerce application needs to integrate with many external systems for payments, shipping, inventory management, email sending, and so on. Halo makes heavy use of the **strategy pattern** - a software design pattern which allows you to replace default behaviors with your own custom implementations as needed.
- **Modular**: Halo is built with a modular architecture, where each unit of functionality of your application is encapsulated in a **plugin**. This makes it easy to add or remove functionality as needed, and to share plugins with the community.
- **Type-safe**: Halo is written in TypeScript, which means that you get the benefits of static type-checking and code completion in your IDE. Our use of GraphQL for our APIs brings static typing to the API layer, enabling rapid development with type-safety across the entire stack.
