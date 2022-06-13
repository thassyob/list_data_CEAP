Getting Started
To get the application running locally:

bundle install
rails db:migrate
rails s

Running tests

rspec /spec

ENDPOINTS:

Create user: POST: "/api/v1/auth" request body: { "name": "Teste", "email": "userteste@example.com", "password": "123456789" }

Login: POST: "/api/v1/auth/sign_in" request body: { "email": "userteste@example.com", "password": "123456789" }

Logout: DELETE: "/api/v1/auth/sign_out"

Create report csv: POST: "/api/v1/reports" request body: { "file": upload_file } }

List report: GET "/api/v1/reports"