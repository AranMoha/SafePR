---
title: Methodological Procedure
has_children: true
nav_order: 2
---

The following content presents approaches for the development of control methods, as well as methods for recognizing and reacting to collision and clamping contacts, which can be used in a human-robot collaboration with parallel robots.
More detailed information can be found in the publications:
- [Detection and Control](https://arxiv.org/abs/2308.09633)
- [Collision Isolation and Identification](https://arxiv.org/abs/2308.09650)
- [Collision and Clamping Reaction](https://arxiv.org/abs/2308.09656)
- [Uncertainties of Contact Classifications](https://arxiv.org/abs/2308.09675)
- [Combined Structural and Dimensional Synthesis](https://arxiv.org/abs/2408.15831)

# Detection, Control and Classification
The generalized impulse calculated from measurements of motor current and angle is used with a dynamics model to estimate external forces.
With exact dynamics modeling, the observer has an error dynamics of first order.
Physical contacts are detected by comparing the estimated external forces component by component with predefined threshold values. The specification of threshold values is necessary because the disturbance observer is based on an uncertain kinematics and dynamics model.

A Cartesian impedance controller is selected to parameterize the contact dynamics in the operational space.
A modal damping is specified to obtain critically damped contact dynamics in the operational space independent of the robot's joint-angle configuration.

<iframe width="560" height="315" src="https://youtube.com/embed/HaazrQsKVhY?si=8DpXQBM71zcANZ1v" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

The first assumption is that unwanted contacts only exert forces on the parallel robot.
A feedforward neural network (FNN) for binary clamp and collision classification was built with the estimation of the disturbance observer.

# Kinetostatic Analysis
Now consider a platform collision.
The disturbance observer estimates the external force and the moment occurring with a lever, which are used to determine the line of action.
Only the part of the external force that is orthogonal to the shortest distance between its line of action and the origin of the platform coordinate system causes a moment.
Mathematically, this corresponds to an underdetermined system of equations whose solution is described by a scalar quantity lambda.
If the platform outer shell is known, the two intersection points lambda_1, lambda_2 can be determined, which correspond to a tensile force (lambda_1) and a compressive force (lambda_2).
Unintentional contacts are assumed to be the latter.
The minimum distance to the platform coupling joint of the kinematic chains is now calculated from the effective line.


# Localization & Isolation
Link collisions differ from platform contact by the minimum distance, which is not equal to zero.
The physical explanation is that contact on the chain acts on the platform coordinates via the passive coupling joint and its line of action therefore intersects the joint.			
Furthermore, it can be observed that a contact at the first segment leads to a projected line of action that is parallel (anti-parallel) to the second segment, while a contact at the second segment includes the angle between the line of action and the position vector from the passive joint to the platform coupling joint.

Physically modeled features describing the position of the line of action of the external forces are used to classify the collided body or the jamming leg chain.
Platform collisions are isolated and identified with an explicit solution, while a particle filter estimates the location and force of other contacts.

## Video

<iframe width="560" height="315" src="https://youtube.com/embed/xD6Zaj6p1f8?si=FLHMEpotQ-BkUukG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

# Reaction
Clamping reactions using a structural opening are performed based on the clamping gap between two segments of the previously classified affected leg chain by calculating the gradient of the clamping joint angle in relation to the rotational platform coordinates, which corresponds to the direction of rotation of the platform to the gap opening.

The starting point for the reactions to collisions is the direction of the line of action of the external forces estimated in the working space.
The advantage of this reaction method is that it is independent of the contact location determination, as only variables estimated in the workspace are used.
The retraction in the direction of the line of action takes place only via the translational platform coordinates and provides an immediate reaction.

## Video

<iframe width="560" height="315" src="https://youtube.com/embed/pcIBYYhcWk4?si=jempzsBbnGImf_7Z" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

# Redundancy Resolution
However, there are limits to the robot, such as joint angle limits or passing through a singularity in the workspace.
This problem is addressed as follows: For a PR with n independently actuatable platform degrees of freedom, retraction must only take place in the opposite direction to the direction of contact, which corresponds to a one-dimensional task in the contact location coordinates.
Accordingly, up to n-1 redundant degrees of freedom remain for the retraction in the contact case, which can be used by means of a redundancy resolution to comply with joint angle limits and singularity avoidance.
