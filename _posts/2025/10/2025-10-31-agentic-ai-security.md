---
layout: post
title: "Agentic AI and security"
link: https://martinfowler.com/articles/agentic-ai-security.html
author: "Martin Fowler"
published_date: "28/10/2025"
description: "Les systèmes d'IA agentique présentent des défis uniques en matière de sécurité. La faiblesse fondamentale des LLM en matière de sécurité réside dans l'absence de moyen rigoureux de séparer les instructions des données, de sorte que tout ce qu'ils lisent est potentiellement une instruction. Cela conduit à la « triple menace » : données sensibles, contenu non fiable et communication externe - le risque que le LLM lise des instructions cachées qui divulguent des données sensibles aux attaquants. Nous devons prendre des mesures explicites pour atténuer ce risque en minimisant l'accès à chacun de ces trois éléments. Il est utile d'exécuter les LLM dans des conteneurs contrôlés et de diviser les tâches de manière à ce que chaque sous-tâche bloque au moins un des trois éléments. Avant tout, procédez par petites étapes qui peuvent être contrôlées et vérifiées par des humains."
language: "en"
categories: "articles"
tags: "ia"
og-tags: "ia"
date: "2025-10-31T10:27:29+01:00"
permalink: /:categories/:year/:month/:day/:title/
---