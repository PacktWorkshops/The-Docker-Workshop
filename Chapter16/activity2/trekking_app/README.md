# Panoramic Trekking App

## Running As A Test Django Applications

Set Up Virtualenv:

`virtualenv --python=<path_to_python3> venv`

Activate the environment:

`source venv/bin/activate`

Install requirements:

`pip install -r requirements.txt`

Start up a postgres instance:

`docker run --rm -d --name postgres-test -e POSTGRES_PASSWORD=docker -p 5432:5432 postgres`

Log into the database and Set up the postgres databases and users:
```
psql postgres -h localhost -U postgres
create user pta_user with password 'pta_password’;
create database pta_database with owner pta_user;
grant all privileges on all tables in schema public to pta_user;
```

Export Your Variables
```
export SQL_ENGINE=django.db.backends.postgresql
export SQL_DATABASE=pta_database
export SQL_USER=pta_user
export SQL_PASSWORD=pta_password
export SQL_HOST=localhost
export SQL_PORT=5432
```

Django migrate and run the server:
```
python manage.py makemigrations
python manage.py migrate 
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin','admin.admin@example.com', 'changeme')"
python manage.py runserver 0.0.0.0:8000
```

Go to the url 0.0.0.0:8000 to test 

## How To Use The Application
- Log into the admin interface to add content at 0.0.0.0:8000/admin
- View images and content from the 0.0.0.0:8000/photo_viewer

## Running The Application With Docker and Docker Compose
The sample docker-compose.yml script runs the Django Application
and also brings up a Database...It automates the process of creating the
specific users and databases on postgres before handling the migration.

The Dockerfile will need to include a .env.dev file which is mounted:
Add the following details in the file:

```
SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=pta_database
SQL_USER=pta_user
SQL_PASSWORD=pta_password
SQL_HOST=db
SQL_PORT=5432
PGPASSWORD=docker
```

Then run the following:

Export the password for the database so it can be connected to via the entrypoint script

```
export PGPASSWORD=docker
```

```
docker-compose build
...
docker-compose up -d
```

## Using the application

Once the application is running, you use the Django Administration console
to add your images and list of countries your images are from.

```
http://0.0.0.0:8000/admin/
```
![Panoramic Trekking App Photo Viewer Page](/screenshots/DjangoAdminPage.png)

# Adding new categories(countries)
Simply click on the add button next to Countries to add a list of countries

# Adding in new images
Click on the add button next to Photos and your see a screen similar to the
screenshot below. Enter a title for the image, details of the image, browse to 
where the image is and country the image is from. Then save.

![Panoramic Trekking App Photo Viewer Page](/screenshots/AddingImages.png)

# Viewing the site
Viewing all the images on the site
```
http://127.0.0.1:8000/photo_viewer/
```
![Panoramic Trekking App Photo Viewer Page](/screenshots/PanoramicTrekkingAppPhotoViewer.png)

Clicking on the Country name on each image or on the main page will bring up all the images for this country

![Panoramic Trekking App Photo Viewer Page](/screenshots/ViewByCategoryCountry.png)

Clicking on the Read More button to view more details about the image

![Panoramic Trekking App Photo Viewer Page](/screenshots/ViewImageDetails.png)


## Things to do
- [x] Nginx Proxy for project
- [x] Correct layout
- Set up testing
- Set up redis caching
- [x] Set up production server
- [x] Document
- [x] Postgresql database
- [x] Dockerise App
- [x] docker-compose
- [x] admin username and password for Django(secure)
- [x] sql username and passwords(secure)

