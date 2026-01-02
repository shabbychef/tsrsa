
THROUGH 		 = 20251130
ALLDATA 		:= $(wildcard data/*.rda)

alldata : $(ALLDATA)

$(ALLDATA): data/%.rda : data-raw/make_%.R
	r $^

tag:
	@-echo "git tag -a thru$(THROUGH) -m 'all data through $(THROUGH)'"
	@-echo "git push --tags"

