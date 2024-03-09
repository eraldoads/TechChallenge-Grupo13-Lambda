const http = require('http'); // Usamos o módulo 'http' em vez de 'https'

exports.handler = async (event) => {

  const body = JSON.parse(event.body);
  const cpf = body.cpf; // Recebe o CPF do evento

  // Dados para o corpo da requisição
  const data = JSON.stringify({ cpf });

  const options = {
    hostname: process.env.URL_BACKEND,
    path: '/login',
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
  };

  return new Promise((resolve, reject) => {
    const req = http.request(options, (res) => {
      let responseBody = '';

      res.on('data', (chunk) => {
        responseBody += chunk;
      });

      res.on('end', () => {
        resolve({
          statusCode: res.statusCode,
          body: responseBody,
        });
      });
    });

    req.on('error', (error) => {
      reject(error);
    });

    req.write(data);
    req.end();
  });
};
