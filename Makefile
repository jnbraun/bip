USE_STB = 1

SRC_DIR = ./src/
SRC = $(SRC_DIR)bip.c
OBJ = $(SRC:.c=.o)
OUT = libbip.a
INCLUDES = -I./inc/ -I./bh/inc/
CCFLAGS = -g -O2
CC = gcc
LDFLAGS = -g

ifeq ($(USE_STB), 1) 
INCLUDES+= -DBIP_USE_STB_IMAGE -I./thirdparty/
CCFLAGS+= -DBIP_USE_STB_IMAGE
endif

default: $(OUT)

%.o: %.c
	$(CC) $(INCLUDES) $(CCFLAGS) -c $< -o $@

$(OUT): $(OBJ)
	ar rcs $(OUT) $(OBJ)

clean:
	rm -f $(OBJ) $(OUT)