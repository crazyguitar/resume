SRC = resume.7
OUT = resume.7.html

all: $(SRC)
	mandoc -Thtml -Ostyle=style.css $(SRC) > $(OUT)

clean:
	rm -f $(OUT)
