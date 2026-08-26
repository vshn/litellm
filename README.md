# Wrapper chart for llm-proxy

First you need to create a secret:
```shell
kubectl -n llm-proxy create secret generic llm-api-keys --from-literal=GEMINI_API_KEY=$GEMINI_API_KEY --from-literal=CORTECS_API_KEY=$CORTECS_API_KEY
```
