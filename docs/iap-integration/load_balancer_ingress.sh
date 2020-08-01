#!/bin/bash
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START servicemesh_load_balancer_ingress]
cat <<EOF | kubectl create -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: example-ingress
  namespace: istio-system
  annotations:
    kubernetes.io/ingress.global-static-ip-name: example-static-ip
    networking.gke.io/managed-certificates: example-certificate
spec:
  backend:
    serviceName: istio-ingressgateway
    servicePort: 80
EOF
# [END servicemesh_load_balancer_ingress]
