require(tidyr)
require(dplyr)
require (ggplot2)
require(extrafont)

tbl_df(df)
#View(df)
select(df, COUNTRY_OR_AREA) %>% tbl_df
QY<-df %>% select(COUNTRY_OR_AREA, QUANTITY,YEAR) %>% filter(COUNTRY_OR_AREA %in% c("Indonesia", "United States", "India", "China"), YEAR %in% c("2006","2007","2008","2009","2010","2011")) %>% mutate(cummin(as.numeric(as.character(QUANTITY)))) %>% group_by(YEAR) %>% tbl_df

ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  facet_grid(~YEAR) +
  labs(title='LPG (Liquidified Petroleum Gas) Consumption') +
  labs(x="Country", y=paste("LPG Usage in Metric Tons")) +
  theme(axis.text.x = element_text(angle=45,hjust=1)) +
  layer(data=QY, 
        mapping=aes(x=COUNTRY_OR_AREA, y=as.numeric(as.character(QUANTITY)),fill=COUNTRY_OR_AREA), 
        stat="identity",
        stat_params=list(),
        geom="bar", 
        geom_params=list(),
        position=position_jitter(width=0.0, height=0)
  )
