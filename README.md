# Right-wing extremism on Google Italia searches during COVID-19 pandemic

## Data Access Capstone Project 2022 📍

### Research question 🔎
Did COVID-19 pandemic period increased the italian right-wing extremism online presence?
Did right-wing related keywords spread on Italian Google searches during the pandemic?

Inspired by a [Rovetta A. study published on JMIR](https://infodemiology.jmir.org/2021/1/e29929/), the aim of this project is testing the hypothesis claiming that the volume of researches on Google Italia about right-wing extremism topics, actors, websites and news has raised during the pandemic.

### Dataset and tools :bookmark_tabs:
To test the hypothesis, we need to create a dataset that contains as many right-wing related keywords as possible. In order to do it, we start from a list of organizations and people linked to right-wing parties and then look for related queries trying to identify the trending keywords among users.

The starting list can be obtained by scraping an already existing map made by [patriaindipendente.it](https://patriaindipendente.it/progetto-facebook/).
The best way to import a dataset with all trending searches on Google is by using [Google Trends](https://trends.google.com/trends/) and, because we're exclusively using R to work on this project, we employ `gtrendsR` package [(more info...)](https://github.com/PMassicotte/gtrendsR).
This package allows us to get a dataset with different variables: `geo`, `time`, `keywords` and `onlyInterest` (a boolean that allows you to call ONLY the `interest_over_time` or not).

⚠️


### References:

- https://infodemiology.jmir.org/2021/1/e29929/
- https://www.patriaindipendente.it/idee/copertine/cronache-dalla-galassia-nera/

