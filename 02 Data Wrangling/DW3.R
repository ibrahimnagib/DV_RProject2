require(tidyr)
require(dplyr)
require (ggplot2)
require(extrafont)

tbl_df(df)
#View(df)
select(df, COUNTRY_OR_AREA) %>% tbl_df
QY<-df %>% select(COUNTRY_OR_AREA, QUANTITY, YEAR) %>%  tbl_df

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
        position=position_jitter(width=1, height=.4)
  )
