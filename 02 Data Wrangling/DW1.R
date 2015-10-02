require(tidyr)
require(dplyr)
require (ggplot2)
require(extrafont)

tbl_df(df)
#View(df)
select(df, COUNTRY_OR_AREA) %>% tbl_df
QY<-df %>% select(COUNTRY_OR_AREA, QUANTITY, YEAR) %>% filter(YEAR=="2012", COUNTRY_OR_AREA %in% c("Myanmar","Cte dIvoire", "Cuba", "Syrian Arab Republic", "Iran(Islamic Rep. of)","United States")) %>% tbl_df

ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='LPG (Liquidified Petroleum Gas) Consumption by Country in 2012 ') +
  labs(x="Country", y=paste("LPG Usage in Metric Tons")) +
  theme_bw() +
  layer(data=QY, 
        mapping=aes(x=COUNTRY_OR_AREA, y=as.numeric(as.character(QUANTITY))), 
        stat="identity",
        stat_params=list(),
        geom="bar",
        geom_params=list(fill='blue'), 
        position=position_jitter(width=0.0, height=0)
  )
