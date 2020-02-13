---
title: FHIR Test Cases Release Notes
---

# FHIR Test Cases Release Notes

## Current (not released yet)

(no changes yet)

## version 1.0.42


* Add a test case for a differential that caused an NPE in the snapshot-generator
* Adjust test cases around lang/xml:lang (see https://www.w3.org/TR/i18n-html-tech-lang/#langvalues)
* Fix validator tests around xhtml language to cover both lang and xml:lang (see https://www.w3.org/TR/i18n-html-tech-lang/#langvalues)
* Add an additional validator test for multiple enableWhen conditions on a questionnaire item

## version 1.0.41


* rename R5 FHIRPath tests to actually say R5, and add a test for doing is on empty collections

## version 1.0.40

* R5/snapshot-generation: Add a new test case for walking into a resource contained in a bundle 
* R5/snapshot-generation: add a new test case for walking into a slice in an extension
* validator: Add a test case for search parameter type validation in CapabilityStatement
* validator: Add test cases from HAPI 

## version 1.0.39

* This release notes record started