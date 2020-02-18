---
title: FHIR Validator Release Notes
---

# FHIR Validator Release Notes

## Current (not released yet)

* NPM sub-system: Change to use http://packages.fhir.org
* Validator: Allow search references in transactions

## v4.1.63 (2020-02-13)

* Java Core: fix but accessing security labels (Coding getSecurity(system, code))
* Version Conversion: Fix the OperationDefinition conversion

## v4.1.62 (2020-02-13)


* NPM sub-system: Fix IHE template to work
* NPM sub-system: Enforce that package versions can only contain the characters a-zA-Z0-9-. or else start with file: followed by a valid local file system reference
* Snap-shot generator: Fix a bug where a differential caused an NPE in the snapshot-generator
* Snap-shot generator: Improve handling of circular dependencies in profiles (better error reporting, less errors)
* Version Conversion: Restructure the version conversion routines to convert extensions more faithfully (and be easier to manage)
* Validator: Fix warnings around xhtml language to cover both lang and xml:lang (see https://www.w3.org/TR/i18n-html-tech-lang/#langvalues)
* Validator: Questionnaire.item.enableWhen validation - stop producing spurious warnings about errors, and check enableWhen in descendent questions (was being ignored)

## v4.1.61 (2020-02-07)

* Snapshot generation: handle profiles on Bundle.entry.resource properly
* Internal: Fix bug accessing a null object

## v4.1.60 (2020-02-02)

* This release notes record started
