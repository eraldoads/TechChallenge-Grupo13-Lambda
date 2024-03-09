resource "aws_cognito_user_pool" "pool" {
  name = "pool"
}

resource "aws_cognito_user_pool_client" "client" {
  name          = "client"
  user_pool_id  = aws_cognito_user_pool.pool.id
  callback_urls = ["${aws_apigatewayv2_stage.stage.invoke_url}/auth"]
  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
  generate_secret        = false
  refresh_token_validity = 1  # in days
  access_token_validity  = 60 # in minutes
  id_token_validity      = 60 # in minutes

  token_validity_units {
    refresh_token = "days"
    access_token  = "minutes"
    id_token      = "minutes"
  }
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = "pikles-auth-domain"
  user_pool_id = aws_cognito_user_pool.pool.id
}

resource "aws_cognito_user" "pikles" {
  username       = "pikles"
  user_pool_id   = aws_cognito_user_pool.pool.id
  message_action = "SUPPRESS"      # Evita a necessidade de confirmação por e-mail
  password       = "Fastfood@2024" # Senha pré-definida para o usuário
}