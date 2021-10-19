# More on Labels and Selectors

Labels and Selectors are used to connect resources.

You can use `matchLabels` or `matchExpressions`. MatchExpressions lets you do some boolean logic.

You can also use matchExpressions in the command line: 
`kubectl delete deployments,services -l group=example`
