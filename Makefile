# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cpoulain <cpoulain@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/06 01:51:31 by cpoulain          #+#    #+#              #
#    Updated: 2025/04/07 11:31:00 by cpoulain         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Includes

include Files.mk

# Commands

RM			:=	/bin/rm -f

# Flags and compiler

CXX			:=	c++
CXXFLAGS	:=	-Wall -Wextra -Werror -g -std=c++98

# Directories

OBJ_DIR		:=	build
BIN_DIR		:=	bin
SRC_DIR		:=	src
INC_DIR		:=	includes

MFF			:=	mff -r=./$(SRC_DIR)/ -t=cpp

# OBJS formatted

OBJS		=	$(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(FILES)))

# Targets

TARGET		:=	$(BIN_DIR)/Animal

# Phony rules

all: $(TARGET)

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) -r $(BIN_DIR)

re: fclean all

mff:
	@$(MFF)
	@printf "Done re-generating Files.mk !\n"

# Binary generation

$(TARGET): $(OBJS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) $(OBJS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

.PHONY: all clean fclean re mff
