# Right-wing extremism on Google Italia searches during COVID-19 pandemic

## Data Access Capstone Project 2022 📍

### Research question 🔎
Did COVID-19 pandemic period increased the italian right-wing extremism online presence?
Did right-wing related keywords spread on Italian Google searches during the pandemic?

Inspired by a [Rovetta A. study published on JMIR](https://infodemiology.jmir.org/2021/1/e29929/), the aim of this project is testing the hypothesis claiming that the volume of researches on Google Italia about right-wing extremism topics, actors, websites and news has raised during the pandemic.

### Dataset and tools :bookmark_tabs:
To test the hypothesis, we create a dataset that contains as many right-wing related keywords as possible. In order to do it, we start from a list of organizations and people linked to right-wing parties and then look for related queries trying to identify the trending keywords among users.

The starting list is obtained by scraping an already existing map made by [patriaindipendente.it](https://patriaindipendente.it/progetto-facebook/).
The best way to import a dataset with all trending searches on Google is by using [Google Trends](https://trends.google.com/trends/) and, because we're exclusively using R to work on this project, we employ `gtrendsR` package [(more info...)](https://github.com/PMassicotte/gtrendsR).
This package allows us to get a dataset with different variables: `geo`, `time`, `keywords` and `onlyInterest` (a boolean that allows to call ONLY the `interest_over_time` or not).

⚠️

## Folders labels

| Folder | Contents |
| ----- | -----|
| makingof | checkpoints and backups |
| data | datasets |
| src | scripts |
| figs | plots and images|


### References:

- [Rovetta A. "The Impact of COVID-19 on Conspiracy Hypotheses and Risk Perception in Italy: Infodemiological Survey Study Using Google Trends"
JMIR Infodemiology 2021;1(1):e29929](https://infodemiology.jmir.org/2021/1/e29929/)
- [Davies G., Wu E. & Frank R. "A Witch’s Brew of Grievances: The Potential Effects of COVID-19 on Radicalization to Violent Extremism" Studies in Conflict & Terrorism; Taylor & Francis 1-24, 2021](https://www.tandfonline.com/doi/figure/10.1080/1057610X.2021.1923188?scroll=top&needAccess=true)
- [Burchill R. "Extremism in the Time of COVID-19"; Bussola Research Paper No. 6, July 15, 2020](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3693293)
- [Singh K. "Effect of COVID-19 on Violent Extremism and Terrorism in Digital Spaces", Centre for Air Power Studies (CAPS), December 2020](https://d1wqtxts1xzle7.cloudfront.net/65213938/Effect_of_Covid_19-with-cover-page-v2.pdf?Expires=1646486122&Signature=ZYLDbbKK-Ll-nEXxFveOmKMIecccuQ4S3zPiARtLSXyFPeT3mCx7UlbivWH3erJMqS32hoEXpaCfwYhMizVLB4n2~HpZzYND84L8iHTXjYPeSiHgVpBItvSyJz25nVt4LSJ2z0JN71e2zIV-qnizrldn-flDz3b5gXcSd-mcUK1D5SRuLzeHOmHDvnlWGgDZcg1Yl049PWVCPPMRl45AF44vLOob6CarcsQV1Mava0rrM-6rutrZIcAViaMbuNHegV8aS~VYzNL772iQT9fig86YsHu54H8JM1NX4xZ~Pi5UlarxDbmSIF8GMSu6jY5JpTCxni2cTlYx7jvo5jVrfw__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA)
- [Patria Indipendente: Cronache dalla galassia nera](https://www.patriaindipendente.it/idee/copertine/cronache-dalla-galassia-nera/)
- [Patria Indipendente: Progetto Facebook, lista](https://www.patriaindipendente.it/progetto-facebook/lista_a.html)
