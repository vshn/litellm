# Wrapper chart for [litellm](https://github.com/BerriAI/litellm)

This wrapper chart is intended to be used in conjunction with [AppFlow](https://control.vshn.net/appflow/apps)

## Initial Setup

Helm tries to install the dependencies before it installs manifests from the wrapper chart.
This fails due to postgres not being available.
This means the [VSHNPostgresql](/templates/vshnpostgresql.yaml) needs to be rendered locally and applied to the cluster before trying to roll out a deployment for the first time.

## Configuration

### Environment Variables

Apart from the usual AppFlow variables, additionally environment variable can be set via enviroment variables in CI/CD settings.

#### API-Keys to llm providers
In addition to setting them in the environment pipeline settings they need to be referenced in the values file see [example](/values.yaml#L20).

### Namespace

The namespace is created via AppFlow.
Once the namespace is created we need to additionally set the label for the [solution-base-monitoring](https://github.com/appuio/component-solution-base-monitoring) and the cluster-monitoring label `openshift.io/cluster-monitoring: "true"`.
