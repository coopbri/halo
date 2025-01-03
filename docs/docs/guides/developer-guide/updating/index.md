---
title: "Updating Vendure"
showtoc: true
---

# Updating Vendure

This guide provides guidance for updating the Vendure core framework to a newer version.

## How to update

First, check the [changelog](https://github.com/vendure-ecommerce/vendure/blob/master/CHANGELOG.md) for an overview of the changes and any breaking changes in the next version.

In your project's `package.json` file, find all the `@vendure/...` packages and change the version
to the latest. All the Vendure packages have the same version, and are all released together.

```diff
{
  // ...
  "dependencies": {
-    "@vendure/common": "1.1.5",
+    "@vendure/common": "1.2.0",
-    "@vendure/core": "1.1.5",
+    "@vendure/core": "1.2.0",
     // etc.
  }
}
```

Then run `bun install` or `bun install` depending on which package manager you prefer.

## Admin UI changes

If you are using UI extensions to create your own custom Admin UI using the [`compileUiExtensions`](/reference/admin-ui-api/ui-devkit/compile-ui-extensions/) function, then you'll need to **delete and re-compile your admin-ui directory after upgrading** (this is the directory specified by the [`outputPath`](/reference/admin-ui-api/ui-devkit/ui-extension-compiler-options#outputpath) property).

If you also have an `.angular` directory in your project, you should delete this too after the update to ensure that any stale cached files are removed.


## Versioning Policy & Breaking changes

Vendure generally follows the [SemVer convention](https://semver.org/) for version numbering. This means that breaking API changes will only be introduced with changes to the major version (the first of the 3 digits in the version).

However, there are some exceptions to this rule:

- In minor versions, (e.g. v2.0 to v2.1) we may update underlying dependencies to new major versions, which may in turn introduce breaking changes. These will be clearly noted in the changelog.
- In minor versions we may also occasionally introduce non-destructive changes to the database schema. For instance, we may add a new column which would then require a database migration. We will _not_ introduce database schema changes that could potentially result in data loss in a minor version.

Any instances of these exceptions will be clearly indicated in the [Changelog](https://github.com/vendure-ecommerce/vendure/blob/master/CHANGELOG.md). The reasoning for these exceptions is discussed in the [Versioning policy RFC](https://github.com/vendure-ecommerce/vendure/issues/1846).

### What kinds of breaking changes can be expected?

Major version upgrades (e.g. v1.x to v2.x) can include:

* Changes to the database schema
* Changes to the GraphQL schema
* Updates of major underlying libraries, such as upgrading NestJS to a new major version

Every release will be accompanied by an entry in the [changelog](https://github.com/vendure-ecommerce/vendure/blob/master/CHANGELOG.md), listing the changes in that release. And breaking changes are clearly listed under a **BREAKING CHANGE** heading.

### Database migrations

Database changes are one of the most common causes for breaking changes. In most cases, the changes are minor (such as the addition of a new column) and non-destructive (i.e. performing the migration has no risk of data loss).

However, some more fundamental changes occasionally require a careful approach to database migration in order to preserve existing data.

The key rule is **never run your production instance with the `synchronize` option set to `true`**. Doing so can cause inadvertent data loss in rare cases.

For any database schema changes, it is advised to:

1. Read the changelog breaking changes entries to see what changes to expect
2. **Important:** Make a backup of your database!
3. Create a new database migration as described in the [Migrations guide](/guides/developer-guide/migrations/)
4. Manually check the migration script. In some cases manual action is needed to customize the script in order to correctly migrate your existing data.
5. Test the migration script against non-production data.
6. Only when you have verified that the migration works as expected, run it against your production database.

### GraphQL schema changes

If you are using a code-generation tool (such as [graphql-code-generator](https://graphql-code-generator.com/)) for your custom plugins or storefront, it is a good idea to re-generate after upgrading, which will catch any errors caused by changes to the GraphQL schema.

### TypeScript API changes

If you are using Vendure providers (services, JobQueue, EventBus etc.) in your custom plugins, you should look out for breakages caused by changes to those services. Major changes will be listed in the changelog, but occasionally internal changes may also impact your code. 

The best way to check whether this is the case is to build your entire project after upgrading, to see if any new TypeScript compiler errors emerge.
