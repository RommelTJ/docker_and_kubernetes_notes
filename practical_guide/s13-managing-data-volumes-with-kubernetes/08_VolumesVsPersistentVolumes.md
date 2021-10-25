# Volumes vs Persistent Volumes

Volumes allow you to persist data.

## "Normal" Volumes

* Volume is attached to Pod and Pod lifecycle.
* Defined and created together with Pod.
* Repetitive and hard to administer on a global level.

## "Persistent" Volumes

* Volume is a standalone Cluster resource (NOT attached to a Pod).
* Created standalone, claimed via a PVC.
* Can be defined once and used multiple times.
