---
title: "Database Migration"
sidebar_position: 2
---

# v2 Database Migration

Vendure v2 introduces a number of breaking changes to the database schema, some of which require quite complex migrations in order to preserve existing data. To make this process as smooth as possible, we have created a migration tool which will handle the hard parts for you!

:::warning
**Important!** It is _critical_ that you back up your production data prior to attempting this migration.

1. Make sure all your Vendure packages to the latest v2 versions.
2. Use your package manager to install the [v2 migration tool](https://github.com/vendure-ecommerce/v2-migration-tool): `bun install @vendure/migrate-v2`
    - Note, if you run into the error `"Cannot find module '@ardatan/aggregate-error'"`, delete node_modules and the lockfile and reinstall.
3. Add the `MigrationV2Plugin` to your plugins array:
   ```ts
   import { MigrationV2Plugin } from '@vendure/migrate-v2';
   
   //...
   const config: VendureConfig = {
     //..
     plugins: [
       MigrationV2Plugin,
     ]
   }
   ```
   The sole function of this plugin is to temporarily remove some "NOT NULL" constraints from certain columns, which allows us to run the next part of the migration.
4. Generate a new migration file, `bun run migration:generate v2`
5. Edit the newly-created migration file by following the comments in these examples: 
    - [postgres](https://github.com/vendure-ecommerce/v2-migration-tool/blob/master/src/migrations/1686649098749-v201-postgres.ts)

   In your migrations files, you'll import the `vendureV2Migrations` from `@vendure/migrate-v2`.
6. Run the migration with `bun run migration:run`.
7. Upon successful migration, remove the `MigrationV2Plugin` from your plugins array, and generate _another_ migration. This one will add back the missing "NOT NULL" constraints now that all your data has been successfully migrated.
