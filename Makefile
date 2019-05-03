SRC = resume.7
OUT = index.html

all: $(SRC)
	mandoc -Thtml -Ostyle=style.css $(SRC) > $(OUT)

clean:
	rm -f $(OUT)
