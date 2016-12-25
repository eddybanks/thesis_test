require "test_helper"

describe FilmCompaniesController do
  let(:film_company) { film_companies :one }

  it "gets index" do
    get film_companies_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_film_company_url
    value(response).must_be :success?
  end

  it "creates film_company" do
    expect {
      post film_companies_url, params: { film_company: { name: film_company.name, type: film_company.type } }
    }.must_change "FilmCompany.count"

    must_redirect_to film_company_path(FilmCompany.last)
  end

  it "shows film_company" do
    get film_company_url(film_company)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_film_company_url(film_company)
    value(response).must_be :success?
  end

  it "updates film_company" do
    patch film_company_url(film_company), params: { film_company: { name: film_company.name, type: film_company.type } }
    must_redirect_to film_company_path(film_company)
  end

  it "destroys film_company" do
    expect {
      delete film_company_url(film_company)
    }.must_change "FilmCompany.count", -1

    must_redirect_to film_companies_path
  end
end
