---
title: FHIR IGPublisher Release Notes
---

# FHIR IGPublisher Release Notes

## Current (not released yet)

(no changes yet)

## version 1.0.64


* Renderer: Workaround NPE in summary renderer for profiles
* Narrative Generation: Fix generator to add both lang and xml:lang per https://www.w3.org/TR/i18n-html-tech-lang/#langvalues (actually get it in the right place this time)
* Publisher: handle bad profile reference in ImplementationGuide.manifest.resource.exampleFor better

## version 1.0.63

* NPM sub-system: Fix IHE template to work
* NPM sub-system: Enforce that package versions can only contain the characters a-zA-Z0-9-. or else start with file: followed by a valid local file system reference
* Snap-shot generator: Fix a bug where a differential caused an NPE in the snapshot-generator
* Snap-shot generator: Improve handling of circular dependencies in profiles (better error reporting, less errors)
* Version Conversion: Restructure the internal version conversion routines to convert extensions more faithfully (and be easier to manage)
* Narrative Generation: Fix generator to add both lang and xml:lang per https://www.w3.org/TR/i18n-html-tech-lang/#langvalues
* Narrative Generation: Fix the generator handle Concept Maps with missing tragets 
* Validator: Fix warnings around xhtml language to cover both lang and xml:lang (see https://www.w3.org/TR/i18n-html-tech-lang/#langvalues)
* Validator: Questionnaire.item.enableWhen validation - stop producing spurious warnings about errors, and check enableWhen in descendent questions (was being ignored)
* Publisher: Ignore files starting with . when scanning for resources
* Publisher: Add opt-out support for stats to IG as a parameter
* Publisher: fix so empty context/contacts/jurisdictions in the IG don't clear these in other resources

## version 1.0.62

* Publisher: Fix problem loading address of current packages
* Snapshot generation: handle profiles on Bundle.entry.resource properly

## version 1.0.61

* This release notes record started