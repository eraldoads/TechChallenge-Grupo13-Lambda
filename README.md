# TechChallenge-Grupo13-Lambda
Este repositório é dedicado ao LAMBDA, API Gateway e Cognito, com a finalidade de incorporar aprimoramentos baseados nas melhores práticas de CI/CD para a API.

Realizamos a criação de todos os recursos com terraform.

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/87dec5c6-b7da-4b8d-ad16-cde65e6ccd1c)

Ao receber um request, a função lambda realiza um POST no endpoint definido na variável de ambiente URL_BACKEND, a qual aponta para o Load Balancer. Este por sua vez, direciona as requisições para o container no ECS.

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/aaa39869-cd7e-4b1a-acbe-180f80fe9173)

Definimos o Cognito como autorizador para o API Gateway:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/e91f3a57-be01-4488-b3fd-24aa5565bc0a)

No Cognito, criamos com terraform um grupo de usuários, um usuário e um client para ser utilizado no processo de autenticação:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/e52e892a-eb46-4a03-a5e2-a30478709491)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/5928da78-9a84-4ae6-9112-753b4a8ba73a)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/b26e6225-848d-4c07-9255-f955754b10da)


Desta forma, é necessária a geração do access token via Cognito para que seja enviado no header do request para o API Gateway:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/1cfc6938-f39c-4c30-9a6c-530943a8bddb)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/9612a9b6-2975-459d-ba65-70fcbcb05449)

Caso o access token não seja válido, será retornada a mensagem "Unauthorized":

![image](https://github.com/eraldoads/TechChallenge-Grupo13-Lambda/assets/47857203/d2406bf3-4259-4283-ad60-8d75aaf4b32a)






