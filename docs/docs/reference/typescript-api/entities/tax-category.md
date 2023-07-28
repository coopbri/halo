---
title: "TaxCategory"
weight: 10
date: 2023-07-26T18:59:56.596Z
showtoc: true
generated: true
---
<!-- This file was generated from the Vendure source. Do not modify. Instead, re-run the "docs:build" script -->
import MemberInfo from '@site/src/components/MemberInfo';
import GenerationInfo from '@site/src/components/GenerationInfo';
import MemberDescription from '@site/src/components/MemberDescription';


## TaxCategory

<GenerationInfo sourceFile="packages/core/src/entity/tax-category/tax-category.entity.ts" sourceLine="14" packageName="@vendure/core" />

A TaxCategory defines what type of taxes to apply to a <a href='/reference/typescript-api/entities/product-variant#productvariant'>ProductVariant</a>.

```ts title="Signature"
class TaxCategory extends VendureEntity implements HasCustomFields {
  constructor(input?: DeepPartial<TaxCategory>)
  @Column() @Column() name: string;
  @Column({ default: false }) @Column({ default: false }) isDefault: boolean;
  @Column(type => CustomTaxCategoryFields) @Column(type => CustomTaxCategoryFields)
    customFields: CustomTaxCategoryFields;
}
```
* Extends: <code><a href='/reference/typescript-api/entities/vendure-entity#vendureentity'>VendureEntity</a></code>


* Implements: <code>HasCustomFields</code>



<div className="members-wrapper">

### constructor

<MemberInfo kind="method" type={`(input?: DeepPartial&#60;<a href='/reference/typescript-api/entities/tax-category#taxcategory'>TaxCategory</a>&#62;) => TaxCategory`}   />


### name

<MemberInfo kind="property" type={`string`}   />


### isDefault

<MemberInfo kind="property" type={`boolean`}   />


### customFields

<MemberInfo kind="property" type={`CustomTaxCategoryFields`}   />




</div>