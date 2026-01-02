
ALLDATA 		:= $(wildcard data/*.rda)

alldata : $(ALLDATA)

$(ALLDATA): data/%.rda : data-raw/make_%.R
	r $^


