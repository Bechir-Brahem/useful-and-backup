[toc]

# php
## preventing xss
when printing values given by the user we should always look for xss injections
instead of 

```php
echo $name
```
we must write 

```php
htmlspecialchars($name) 
```

## Mysqli
to open a connection:

```php
    $db=new mysqli('host','user','user_password','database');
```

to prevent sql injection we use this function `$db->real_escape_string($data_passed_in_a_query)`

another way is to prepate statements:

```php
$stmt ?$db->prepare(
    "INSERT INTO table (col1,col2) VALUES (?,?)"
);
$stmt->bind_param('ss',$value1,$value2); // ss is the type of the data
$stmt->execute();
```

to insert into a table:

```php
    $sql=sprintf("INSERT INTO people (col1,col2) VALUES ('%s','%s')",
        $db->real_escape_string($val_col1),
        $db->real_escape_string($val_col2)
    );
    $response=$db->query($sql);
```

to close a connection we use `$db->close();`


# symfony

## setup
install from their website
you must add .env databse to avoid could not find drive errors
install composer


## start a new project:

```
symfony new --full project_name
```

or 

```
symfony new project_name
```

you need also to fix the .env file

## start a server

```
symfony serve
symfony serve -d (to run in the background)
symfony server:status
symfony server:stop
```

## Routes

you can add a route in config/routes.yaml

```yaml
index:
    path: /
    controller: App\Controller\QuestionController::homepage
```

and add a controller file in src/controller that returns a response 

```php
namespace App\Controller;
use Symfony\Component\HttpFoundation\Response;
class QuestionController
{
    public function homepage()
    {
        return new Response('What a bewitching controller we have conjured!');
    }
}
```

**Annotations**

```
composer require annotations
```

you can add a route by using the @Route

```php
use Symfony\Component\Routing\Annotation\Route;
class QuestionController
{
    /**
     * @Route("/")
     */
    public function homepage()
    {
    }
}
```

you can also add annotations in the beginning of a class

```php
/**
 * Class ToDoController
 * @package App\Controller
 * @Route ("todo")
 */
class ToDoController extends AbstractController
{
    /**
     * @Route("/", name="to_do")
     */
    public function index(SessionInterface $session): Response
    {
    }
}
```

this way every route inside the class will have to start with /todo  
example to access ToDoController::index we have to go to website.com/todo/

**A Wildcard Route** you can also make a wildcard on routes 

```php
class QuestionController
{
    /**
     * @Route("/questions/{slug}/{other}")
     */
    public function show($slug,$other)
    {
    }
}
```

to see all our routes we can use `php bin/console debug:router`

we can also specify the expected method in the route

```php
/**
* @Route("/comments/{id}/vote/{direction}", methods="POST")
*/
```

we can also specify the slug with regex. this example specifies that direction
should be "up" or "down"

```php
/**
* @Route("/comments/{id}/vote/{direction<up|down>}", methods="POST")
*/
```



to see the controller that matches our route we check with 

```sh
php bin/console router:match /comments/10/vote/up --method=POST
```

## Services

### general

services are objects found in symfony that achieve some functionalities
you can find all the services with 

```sh
php bin/console debug:autowiring
# or add a keyword to see specific services
php bin/console debug:autowiring log
```

bundles also allow us to add some configs to them from a yaml file
we can see the allowed configs with (we can find the name by checking the 
budle.yaml file in /config)

```sh
php bin/console config:dump KnpMarkdownBundle
```

you can then add a yaml file in  config/packages/ with any name you want and
specifiy the new config 

```yaml
knp_markdown:
    parser:
        service: markdown.parser.light
```

services in symfony are all contained in a logical container
and you can see all the services here. not all of these services are autowired

```sh
php bin/console debug:container
```

we can only autowire services to class constructors ot to controllers.

the container also has parameters and they can be viewed with

```sh
php bin/console debug:container --parameters
```

to add a paramater we can go to any yaml file in configs and add this (example)

```yaml
parameters:
    cache_adapter: cache.adapter.apcu
```

`'%some_parametetr%'` the % indicate that the we should replace it with the value
of its name (between the %)  
you can override a parameter in dev mode if you place it in the dev folder


to see your parameter in a controller we can use 

```php
$this->getParameter('cache_adapter');
```

to pass parameters to services with dependency injection we must add a variable 
to the arguments of the contructor. and also add the parameter and its value to the
services.yaml file (use arguments or bind both will work)


```yaml
services:
    App\Service\MarkdownHelper:
        arguments:
            $isDebug: true
```

some services have the same interface for different classes 
like monolog with `./bin/console debug:autowiring log` we can see that it has
many channels and we can selects which one to pass if we use the exact variable name
`LoggerInterface $markdownLogger` 

**passing non-autowirable-services to other services**  
one way to do this is by adding the exact reference found in 
`debug:autowiring` first we write the id and then we use @ so that 
we indicate that we want to pass the object not a string

```yaml
services:
    _defaults:
        bind:
            Psr\Log\LoggerInterface $mdLogger: '@monolog.logger.markdown'
```

we can also just straight up add it this way  as this will create an alias
with the name `Psr\Log\LoggerInterface $mdLogger` 

```yaml
services:
    Psr\Log\LoggerInterface $mdLogger: '@monolog.logger.markdown'
```

### controllers

controllers are also services   
controllers can be autowirable  
controllers can take 4 type of arguments:

1. slugs: parameters of the route
2. autowired services
3. requests like from a post request
4. and entity class directly

to view content of a **POST** request we can use 

```php
$direction=$request->request->get('direction');
```
this will return the value of direction found in the post request


### creating a new service

simply adding a new php class file in a directory in src will create a new service and we can
check that with 

```sh
php bin/console debug:autowiring keyword --all
```

and we can use out service with autowiring in our controller.  
sometimes we need to use other services in our service we can pass these services from our controller to our service as a paramater
but a better solution is **dependency injection** which consists of adding a constructor to our class and then autowiring
these services and storing them in private class variables.



### useful examples

#### logger

and then you can add the service as a paramater to the controller

```php
use Psr\Log\LoggerInterface;
class CommentController extends AbstractController
{
    public function commentVote($id, $direction, LoggerInterface $logger)
    {
        $logger->info("entered comment vote")
    }
}
```

#### markdown

this service adds markdown support

```sho
composer require knplabs/knp-markdown-bundle
php bin/console debug:autowiring markdown
```

you can use the service found in debug:autowiring also in a controller and then passed it to twig as a variable and in twig use the filter `raw`

```php
 public function show($slug, MarkdownParserInterface $markdownParser)
    {
        $questionText = 'some **Markdown** *text*';
        $parsedQuestionText = $markdownParser->transformMarkdown($questionText);
    }
```

also you can use markdown as a filter in twig directly 
striptags is there to prevent xss

```twig
{{ answer| striptags |markdown }}
```

#### caching

to see the cache service available

```sh
php bin/console debug:autowiring cache
```

then we can use it with 

```php
class QuestionController extends AbstractController
{
    public function show($slug, MarkdownParserInterface $markdownParser, CacheInterface $cache)
    {
        $parsedQuestionText = $cache->get('markdown_'.md5($questionText), function() use ($questionText, $markdownParser) {
            return $markdownParser->transformMarkdown($questionText);
        });
    }
}
```

#### MakerBundle

```sh
composer require maker --dev
```

maker bundle allows you to create config,php,twig files. or create databases console commands twig extensions
very quickly you can see all of its commands with `php bin/console make:`  
to make a command for example we can use

```
php bin/console make:command
```

it will ask some information and then it will create a file in `src/command/` that is ofc a service
and then we can launch it with `php bin/console app:command_name`
symfony will recongnize that the .php file in src/command is a command when it sees its parent class 
Command and this automatic search is configured in `services.yaml autoconfigure: true`



## Environment

to change the environment from development to production we set the APP\_ENV=dev  variable in the .env file to prod/test/dev  
you can also set the bundles to work only in specific environment in bundles.yaml  

**symfony keeps a cache for web files (like twig) in prod mode** this helps with performance to reset the cache we have to use

```sh
php bin/console cache:clear
```



## API

we can return json files from our controller to build api functionalities

```php
return new JsonResponse(['votes' => $currentVoteCount]);
return $this->json(['votes' => $currentVoteCount]);
```
 
or we can use Symfony/Serializer to send objects as json

## twig

twig allows us to make html templates and use logic and loops in html very easily

in config/packages/twig.yaml

```yaml
twig:
    default_path: '%kernel.project_dir%/templates'
```

you can configure where you want to store your templates

base.html.twigh template

```twig
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>{% block title %}Welcome!{% endblock %}</title>
        {% block stylesheets %}{% endblock %}
    </head>
    <body>
        {% block body %}{% endblock %}
        {% block javascripts %}{% endblock %}
    </body>
</html>

```

first we need to extend from AbstractController

```php
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
class QuestionController extends AbstractController
{
}
```

pass a variable to a twig file form php

```php
class QuestionController extends AbstractController
{
    public function show($slug)
    {
        return $this->render('question/show.html.twig', [
            'question' => "is math related to science?"
            'answers' => [1,2,3,4,5]
        ]);
    }
}
```

and in twig we print the question

```twig
<h1>{{ question }}</h1>
{# this is a comment #}
<ul>
    {% for answer in answers%}
        <li> {{ answer }} </li>
    {% endfor %}
</ul>
{# filters #}
{{ answers|length  }}
```

we can extend a parent template to override some blocks in it

```twig
{% extends 'base.html.twig' %}
{% block title %} this is a new title {% endblock %}

{% block body %}
<h1>{{ question }}</h1>
{% block endblock %}
```

**paths in twig** 
we can give the name of the route in twig so it takes us to the corresponding 
controller also if the controller requires a slug we can add another argument
to the path function

```twig
<a href="{{ path('app_question_show', { slug: 'reversing-a-spell' }) }}" >
```

we can use `{{ parent() }}` inside of a twig block to repeat to include
the content of the parent block

```twig
{% block javascripts %}
    {{ parent() }}
    <script src="{{ asset('js/question_show.js') }}"></script>
{% endblock %}
```

**creating twig extension/filters**  
using the maker bundle we can create a template for our extension with 

```
php bin/console make:twig-extension
```

then in `src/Twig` we can find a file that has this structure

```twig
class MarkdownExtension extends AbstractExtension
{
    public function getFilters(): array
    {
        return [
            new TwigFilter('filter_name', [$this, 'doSomething']),
        ];
    }

    public function getFunctions(): array
    {
        return [
            new TwigFunction('function_name', [$this, 'doSomething']),
        ];
    }

    public function doSomething($value)
    {
        // ...
    }
}

```

replace function

```twig
new TwigFilter('parse_markdown', [$this, 'parseMarkdown'], ['is_safe' => ['html']])
```

we can replace getFilters by this line as an example  
for protection against xss twig wont execute the return twig function directly so to indicate that it is safe
we use 'is_safe'. the ouput of our twig filter should be a string returned in the function doSomething


we can pass objects from controllers to twig like we pass other variables.
and we access the methods and atributes of this object with `object.atribute_name`
if the atribute is private and it has a getAtribute method we can still use the dot 
to get access to it because twig will just append get to the name you just passed in that case   
so we can create function like getAtrString() and then use object.atrString


## webpack encore 

```php
composer require "encore:^1.8"
yarn install
```

the recipe adds two example files in assets/app.js and assets/styles/app.css
now we can run 

```php
yarn watch
```

now whenever we make changes to the assets files they will be included in the public/build directory
we can include css and js files this way

```php
<html>
    <head>
        {% block stylesheets %}
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Spartan&display=swap">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
            {{ encore_entry_link_tags('app') }}
        {% endblock %}
    </head>
     <body>
        {% block javascripts %}
            <script
              src="https://code.jquery.com/jquery-3.4.1.min.js"
              integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
              crossorigin="anonymous"></script>
            {{ encore_entry_script_tags('app') }}
        {% endblock %}
    </body>

</html>
```

we can also add npm packages as jquery or bootstrap and reference them easily in our code

```
yarn add jquery --dev
yarm add bootstrap --dev
```

and add this line in app.js 

```javascript
import $ from 'jquery';
```

and thi sline in app.css

```css
@import "~bootstrap";
```


## debugging

```
composer require profiler --dev
```

the dev option is indicated so that this package wont be installed in production

we can use `dump($variable1, $variable2)` or `dd($var)` to dump and die

this tool will help us print dumped variables in the terminal
so that we can see them when there's a redirection

```
composer require debug
php bin/console server:dump
```


## database

### setup

first we need to install doctrine

```
composer require orm
```

then we should initiate a docker database config file with maker bundle

```
php bin/console make:docker:database
```

and then we launch the mysql database with 

setting up docker:  
install docker from their website's steps then we should add docker to the sudo
group 

```bash
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo su ${USER}
sudo systemctl restart docker
docker run hello-world
```

```
dockerd
docker-compose up -d
```

we use this to show all the containers that docker-compose is running for this project

```
docker-composer ps
```

to connect to the database we use either of these commands and the port should be 
the one found in `docker-compose ps`

```
mysql -u root --password=password --host=127.0.0.1 --port=32773

docker-compose exec database mysql -u root --password=password
```

doctrine will override our .env database url when symfony is running 
we can check that with 

```
symfony var:export --multiline
```

and we can see in the profiler lower debug bar in the server tab that we imported
env vars from docker

to create a database

```
# run docker-compose
symfony console doctrine:database:create
```

sor stability and determinism reasons we should replace latest in docker-compose.yaml to
the version of mysql and restart docker-compose
and also change the `server_version` to the same version in `config/packages/doctrine`

**creating an entity class**  

```
symfony console make:entity
```

running this will create two files in src/repository and src/entity that will allow
you to generate migrations and create a table in the database

to create migrations we run

```
symfony console make:migration
```

this will create a folder migrations with a file that contains the sql query 
to make the corresponding changes 

to execute the migration we use 

```
symfony console doctrine:migrations:migrate
```

and to see them 

```
symfony console doctrine:migrations:list
```

if we make changes to the entity file like add unique=true to a column
and we make a migration it wont recreate the whole database it will check the last migration version
and add the specific query to it



**writing to a database**

first we prepare our object then we use the autowirable `EntityManagerInterface`
to save that onto our database 

```php
public function newQuestion(EntityManagerInterface $entityManager)
{
     $question=new Question();
     $question->setName("missing pants")
         ->setSlug("some other text")
         ->setAskedAt(new \DateTime(sprintf('-%d days', rand(1, 100))))
         ->setQuestion("some text");
    $entityManager->persist($question);
    $entityManager->flush();
    return new Response(sprintf(
        'Well hallo! The shiny new question is id #%d, slug: %s',
        $question->getId(),
        $question->getSlug()
    ));
}
```

**fetching data from a database**

to fetch data we first create a repository variable 
and then execute fetching functions.
 the `/** @var Question|null $question */` indicates that question can be null
 and we raise a 404 error if the link is not available

```php
public function show($slug, MarkdownHelper $markdownHelper, EntityManagerInterface $entityManager)
{
    $repository = $entityManager->getRepository(Question::class);
    /** @var Question|null $question */
    $question = $repository->findOneBy(['slug' => $slug]);

    if (!$question) {
        //raising a 404 exception
        throw $this->createNotFoundException(sprintf('no question found for slug "%s"', $slug));
    }
}
```


we can also use ORDERBY found in sql

```php
$quest=$repo->findBy([],['askedAt'=>'DESC']);
```

the entityManager->getRepository(classname::name) returns an instance of that class
that resides in src/Repository  
doctrine uses a similar language to sql called DQL (doctrine query language) 
which is sql but with class atribute names in place of table names 
we can also make our custom query functions in our Repository file like this example

```php
public function findByNewest()
{
    return $this->createQueryBuilder('q')
        ->andWhere('q.askedAt IS NOT NULL')
        ->orderBy('q.askedAt', 'DESC')
        ->getQuery()
        ->getResult();
}

```

and then we can use it from $repository
we can also chain QueryBuilders 

```php
  public function findAllAskedOrderedByNewest()
    {
        $qb = $this->createQueryBuilder('q');
        return $this->addIsAskedQueryBuilder($qb)
            ->orderBy('q.askedAt', 'DESC')
            ->getQuery()
            ->getResult()
        ;
    }
    private function addIsAskedQueryBuilder(QueryBuilder $qb): QueryBuilder
    {
        return $qb->andWhere('q.askedAt IS NOT NULL');
    }

```

also i wont get into a lot of details but this code 

```php
/**
* @Route("/questions/{slug}", name="app_question_show")
*/
public function show($slug,EntityManagerInterface $entityManager)
{

    $repo=$entityManager->getRepository(Question::class);
    /** @var Question|null $quest  */
    $quest=$repo->findOneBy(['slug'=> $slug]);
    if($quest==null)
    {
        throw $this->createNotFoundException("cant find this page");
        //404
    }
    return $this->render('question/show.html.twig', [
        'question' => $quest,
    ]);
}
```

can be replaced with this shortcut only when the slug name in this case `slug` 
is an atribute in the class Question

```php

    /**
     * @Route("/questions/{slug}", name="app_question_show")
     */
    public function show($slug,Question $question)
    {
        return $this->render('question/show.html.twig', [
            'question' => $question,
        ]);
    }
```

to add a new table to the database we can update it with 

```
symfony console make:entity
symfony console make:migration
symfony console doctrine:migrations:migrate
```

to add default values we can just add =SOME-VALUE in the class definition

```php

class Question
{

    /**
     * @ORM\Column(type="integer")
     */
    private $votes = 0;

}

```

since controllers can take entity classes as arguments it wont be necessary 
to persist the class witn entity manager we can flush its contents directly



## utilities 

### date 

we can install 

```
knplabs/knp-time-bundle
```

and then in twig we can use the extension ago to transform \DateTime format to 
"3 minutes ago" format 

```twig
{{ question.askedAt| ago }}
```
