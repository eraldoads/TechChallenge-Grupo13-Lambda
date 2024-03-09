# TechChallenge-Grupo13-Lambda
Este repositório é dedicado ao LAMBDA, API Gateway e Cognito, com a finalidade de incorporar aprimoramentos baseados nas melhores práticas de CI/CD para a API.

Realizamos a criação de todos os recursos com terraform.

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/87dec5c6-b7da-4b8d-ad16-cde65e6ccd1c)

Ao receber um request, a função lambda realiza um POST no endpoint definido na variável de ambiente URL_BACKEND, a qual aponta para o Load Balancer. Este por sua vez, direciona as requisições para o container no ECS.

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/aaa39869-cd7e-4b1a-acbe-180f80fe9173)

Definimos o Cognito como autorizador para o API Gateway:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/e91f3a57-be01-4488-b3fd-24aa5565bc0a)

Desta forma, é necessária a geração do access token no Cognito para que seja enviado no header do request para o API Gateway:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/1cfc6938-f39c-4c30-9a6c-530943a8bddb)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/9612a9b6-2975-459d-ba65-70fcbcb05449)

Caso o access token não seja válido, será retornada a mensagem "Unauthorized":

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/d2406bf3-4259-4283-ad60-8d75aaf4b32a)






