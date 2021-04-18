# Seedrs Investment Platform

### Description
Seedrs Investment Platform is a service that allows to list available campaigns and create investment

### Prerequisites
The whole app runs on [Docker](https://www.docker.com/). The project was successfully build using Docker Desktop v 3.2.2 on Mac OS 10.15.6

### How to build and run the project
- Clone the repository: `$ git@github.com:jakubkouba/seedrs_investmet_platform.git`
- CD to the project directory: `$ cd seedrs_investmet_platform`
- Spin up the docker containers: `$ docker-compose up`
- Create DB: `$ docker-compose run web bundle exec rake db:create`
- Migrate DB: `$ docker-compose run web bundle exec rake db:migrate`
- Seed DB with campaigns: `$ docker-compose run web bundle exec rake db:seed`
- Run tests: `$ docker-compose run web bundle exec rspec`
- Access the app on: `localhost:3000` 

### Campaigns API
Campaigns are listed via `/api/v1/campaigns` endpoint. 

The response can be paginated by using `page` and `per_page` params. By default fist page with 25 records will be displayed. To get first page with te records use the following curl command

`$ curl --location --request GET 'localhost:3000/api/v1/campaigns?page=1&per_page=10'`

Campaigns can be filtered by following parameters:
 - name 
 - sector 
 - country 
 - investments_count
 
 E.g. to search the campaigns by number of investments the following command can be used
 
 `$ curl --location -g --request GET 'localhost:3000/api/v1/campaigns?page=1&per_page=10&search[investments_count]=2'`

### Investments API

Investments is possible to create via `/api/v1/investments` endpoint. This endpoint accepts `campaig_id` and `amount` params.
The `campaign_id` needs to be id of existing campaign. Campaign id's can be fetched with the previous endpoint. The `amount` param needs to be
a multiple of the `investment_multiple` from campaign. E.g. if `investment_multiple = 10.00` then the `amount` can be `10.00, 20.00, 30.00 ...`. Let say that there is
a campaign with `id = 1` and `investment_multiple = 45305.0`. Then the investment can be created via the following command

`$ curl --location --request POST 'localhost:3000/api/v1/investments' --header 'Content-Type: application/json' --data-raw '{ "amount": 45305.0, "campaign_id": 1}'`

### TODO
- fix failing specs
- permit pagination params
- 500 error on create investments
- improve search (when search by two attributes the search result is empty)
- use resource method for generating routes
