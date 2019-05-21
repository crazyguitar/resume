SRC = resume.7
TMP = resume.html
OUT = index.html

STYLE    = style.css
MINSTYLE = style.min.css

.PHONY: all clean

all: $(SRC)
ifndef SKIPMIN
	mandoc -Thtml -Ostyle=$(MINSTYLE) $(SRC) > $(TMP)
	html-minifier --collapse-whitespace \
				--remove-comments \
				--remove-optional-tags \
				--remove-redundant-attributes \
				--remove-script-type-attributes \
				--remove-tag-whitespace \
				--use-short-doctype \
				--minify-css true \
				--minify-js true -o $(OUT) $(TMP)
	html-minifier --collapse-whitespace \
				--remove-comments \
				--remove-optional-tags \
				--remove-redundant-attributes \
				--remove-script-type-attributes \
				--remove-tag-whitespace \
				--use-short-doctype \
				--minify-css true --minify-js true -o $(MINSTYLE) style.css
else
	mandoc -Thtml -Ostyle=$(STYLE) $(SRC) > $(TMP)
	mv $(TMP) $(OUT)
endif
	rm -f $(TMP)

clean:
	rm -f $(OUT) $(TMP) $(MINSTYLE) resume.log resume.out resume.aux resume.synctex.gz
