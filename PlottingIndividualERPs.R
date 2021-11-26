library(ggplot2)


# Step 1: Load in database
ERPWaveform <- read.csv("ERPDatabase.csv")

# Step 2: Plot each individual's data by Group
library(ggplot2)

ggplot(data=ERPWaveform, aes(x=Time, y=Amplitude, group=factor(PartID))) +
  ggtitle("P3 amplitude by Group") +
  geom_smooth(method=loess, se=FALSE, fullrange=FALSE, lty=1, size=.5,  colour="gray40") +
  #geom_smooth(aes(group=1), method=loess, se=FALSE, fullrange=FALSE, lty=1, size=2, color="blue") +
  facet_wrap(~GroupID) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.spacing = unit(2,"lines"),
        panel.border=element_blank(),
        panel.background=element_blank(),
        strip.background = element_blank(),
        axis.title.x = element_text(family = "sans", colour = "black", size = 12),
        axis.title.y = element_text(family = "sans", colour = "black", size = 12),
        axis.text = element_text(family = "sans", colour = "black", size = 12),
        axis.line = element_line(size = 1, linetype = "solid"), legend.position="right") +
  labs(x = "Time (ms)",y = expression(paste("Amplitude (",mu,"V)")),colour = "") +
  scale_y_reverse()



