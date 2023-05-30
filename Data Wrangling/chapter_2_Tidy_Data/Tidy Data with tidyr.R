#-- Tidy Data with tidyr package ----

#Tidy data allows you to you to spend more time on the analytic questions at hand
#tidyr provides a bunch of tools to help tidy up your messy datasets

#A tidy dataset entails:
# 1.Each variable must have its own column.
# 2. Each observation must have its own row.
# 3. Each value must have its own cell.

library(tidyverse)
tidyr::billboard
colnames(billboard)
