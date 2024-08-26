DIR	=	srcs/docker-compose.yml
VOL	=	/home/smarty/data

all:	run

run	:
	docker-compose -f $(DIR) up --build -d

stop:
	docker-compose -f $(DIR) down

kill:
	docker-compose -f $(DIR) kill

clean-all:
	sudo docker system prune -a -f

fclean : clean-all

re: fclean run