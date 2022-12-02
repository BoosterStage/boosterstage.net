---
title: ContentUpgrade.me
subtitle: Lead magnet list-building tool for Medium and Wordpress bloggers.
date: 2017-10-12 00:00 CST
excerpt: ContentUpgrade.me is a list-building tool for authors who publish on Medium.com.
tags: MVP, Marketing

client: Internal Project
services: Product Design, Product Development, Branding, Promotion
timeframe: 2 months
---

We built ContentUpgrade.me from the ground up in just two weeks.

The idea was to create a list-building tool for authors who publish on Medium.com. Lead magnets are an effective way to grow an email list. A lead magnet invites readers to enter their email address in order to download some additional piece of content (usually a PDF) connected with the article - it might be a white paper, checklist, slide deck, or any downloadable asset.

There were several tools that would let authors embed "subscribe now" forms in the body of their articles, but none supported embedding an actual lead magnet. As a tool we wanted ourselves, we thought this would be an excellent opportunity to try our [Lean MVP development process](/mvp) on a brand-new SaaS product.

We began by initializing a new Ruby on Rails application, which later became the foundation of our [Launchpad](/launchpad) starter app. This "greenfield" app enables us to save lots of time and work at the beginning of a project because most of the common elements that are needed in every web app - user login, registration, admin controls, etc. are already built.
![Code Repository](/portfolio/contentupgrade-me/Github.png)

## Embedding using the open-source OEmbed protocol

Embedding the lead magnet widget is accomplished using the [OEmbed](https://oembed.com/) protocol. Medium.com uses the [Embed.ly](https://embed.ly/) service to expand OEmbed links into rich data embeds.

When a user pastes the unique URL for a ContentUpgrade.me lead magnet, the URL automatically expands into an embedded widget.
![ContentUpgrade.me Demo](/portfolio/contentupgrade-me/demo3.gif)

## Full-Featured Admin and Live Preview Customization

We built a full-featured admin area, including a live-preview customization widget using Vue.js.

The customization tool allows users to edit the headline, body copy, input placeholder text, and button copy, using a WYSIWYG editor. You can view what the final widget will look like, while you're editing it.
[![ContentUpgrade.me Live Preview Editor](/portfolio/contentupgrade-me/Editor.png)](/portfolio/contentupgrade-me/Editor.png)

## Built-in Integrations

One of the most important features of a lead generation tool is the ability to communicate with your existing mailing list. ContentUpgrade.me shipped with native integrations for [Drip](https://drip.com), [MailChimp](https://mailchimp.com), and [Aweber](https://aweber.com).
![ContentUpgrade.me Integrations](/portfolio/contentupgrade-me/Integrations.png)

Additionally, we created a [Zapier](https://zapier.com) integration that allows authors to connect ContentUpgrade.me to hundreds of other services.
[![Zapier Integration](/portfolio/contentupgrade-me/Zapier.png)](/portfolio/contentupgrade-me/Zapier.png)

## Payment Integration via Stripe.

[The only true form of product validation](/articles/the-three-questions-every-successful-product-must-answer) is whether or not people are willing to pay for it. So we created a Stripe integration and a payment page to allow users to upgrade to a paid version of the product. Upgrading unlocks more options and allows users to create more lead magnets.
[![Stripe Integration](/portfolio/contentupgrade-me/Stripe.png)](/portfolio/contentupgrade-me/Stripe.png)

## Launch and Marketing

We built an integrated marketing website that highlights the product's key features and provides a strong call to action (CTA) to encourage users to sign up and try the product.
[![ContentUpgrade.me Homepage](/portfolio/contentupgrade-me/Home.png)](/portfolio/contentupgrade-me/Home.png)

Additionally, we built out a help site that walks users through common tasks and answers frequently asked questions.
[![ContentUpgrade.me Homepage](/portfolio/contentupgrade-me/Help.png)](/portfolio/contentupgrade-me/Help.png)
