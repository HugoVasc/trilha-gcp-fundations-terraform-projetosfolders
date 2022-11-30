provider "google" {
  project = "hugotech-devops-iac "
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}


resource "google_folder" "Tecnico" {
  display_name = "Técnico"
  parent       = "organizations/56151834126"
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Tecnico.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.Mobile.name
}

resource "google_project" "hugotech-mobile-dev" {
  name       = "Mobile-Dev"
  project_id = "hugotech-salesfmobileorce-dev"
  folder_id  = google_folder.Mobile.Desenvolvimento.name
  auto_create_network=false
  billing_account = "01BEE5-91898F-94F129"

}

resource "google_project" "hugotech-mobile-prod" {
  name       = "Mobile-Prod"
  project_id = "hugotech-salesfmobileorce-prod"
  folder_id  = google_folder.Mobile.Producao.name
  auto_create_network=false
  billing_account = "01BEE5-91898F-94F129"

}

resource "google_folder" "Web" {
  display_name = "Web"
  parent       = google_folder.Tecnico.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Web.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.Web.name
}

resource "google_project" "hugotech-web-dev" {
  name       = "Web-Dev"
  project_id = "hugotech-salesfweborce-dev"
  folder_id  = google_folder.Web.Desenvolvimento.name
  auto_create_network=false
  billing_account = "01BEE5-91898F-94F129"

}

resource "google_project" "hugotech-web-prod" {
  name       = "Web-Prod"
  project_id = "hugotech-salesfweborce-prod"
  folder_id  = google_folder.Web.Producao.name
  auto_create_network=false
  billing_account = "01BEE5-91898F-94F129"

}

resource "google_folder" "Financeiro" {
  display_name = "Financeiro"
  parent       = "organizations/56151834126"
}

resource "google_folder" "SalesForce" {
  display_name = "SalesForce"
  parent       = google_folder.Financeiro.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.SalesForce.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.SalesForce.name
}

resource "google_project" "hugotech-salesforce-dev" {
  name       = "SalesForce-Dev"
  project_id = "hugotech-salesforce-dev"
  folder_id  = google_folder.SalesForce.Desenvolvimento.name
  auto_create_network=false
  billing_account = "01BEE5-91898F-94F129"

}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.SalesForce.name
}


# resource "google_project" "hugotech-salesforce-prod" {
#   name       = "SalesForce-Prod"
#   project_id = "hugotech-salesforce-prod"
#   folder_id  = google_folder.SalesForce.Producao.name
#   auto_create_network=false
#   billing_account = "01BEE5-91898F-94F129"
# }