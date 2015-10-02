require(tidyr)
require(dplyr)
require (ggplot2)
require(extrafont)

tbl_df(df)
#View(df)
select(df, COUNTRY_OR_AREA) %>% tbl_df
QY<-df %>% select(COUNTRY_OR_AREA, QUANTITY, YEAR) %>% filter( COUNTRY_OR_AREA %in% c("Myanmar","Cte dIvoire", "Cuba", "Syrian Arab Republic", "Iran(Islamic Rep. of)","United States")) %>% tbl_df

ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title='LPG (Liquidified Petroleum Gas) Consumption ') +
  labs(x="Year", y=paste("LPG Usage in Metric Tons")) +
  theme_bw() +
  layer(data=QY, 
        mapping=aes(x=as.numeric(as.character(YEAR)), y=as.numeric(as.character(QUANTITY)), color=COUNTRY_OR_AREA), 
        stat="identity",
        stat_params=list(),
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.2, height=0)
  )
