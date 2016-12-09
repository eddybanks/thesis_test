require "test_helper"

describe FilmsController do
  let(:film) { films :one }

  it "gets index" do
    get films_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_film_url
    value(response).must_be :success?
  end

  it "creates film" do
    expect {
      post films_url, params: { film: { title: film.title } }
    }.must_change "Film.count"

    must_redirect_to film_path(Film.last)
  end

  it "shows film" do
    get film_url(film)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_film_url(film)
    value(response).must_be :success?
  end

  it "updates film" do
    patch film_url(film), params: { film: { title: film.title } }
    must_redirect_to film_path(film)
  end

  it "destroys film" do
    expect {
      delete film_url(film)
    }.must_change "Film.count", -1

    must_redirect_to films_path
  end
end
