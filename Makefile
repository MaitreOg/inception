USER=		smarty
IMG_DIR=	Images
DIR	=		srcs/docker-compose.yml
VOL	=		/home/$(USER)/data

all:	run

run	:
	@mkdir -p /home/$(USER)/data
	@mkdir -p /home/$(USER)/data/mariadb
	@mkdir -p /home/$(USER)/data/wordpress
	@mkdir -p $(IMG_DIR);
	docker-compose -f $(DIR) up --build -d
	@$(MAKE) save-images
stop:
	docker-compose -f $(DIR) down

kill:
	docker-compose -f $(DIR) kill

clean-all:
	sudo docker system prune -a -f
	@echo "Delete Docker images..."
	@rm -rf $(IMG_DIR)/*;

fclean : clean-all

re: fclean run

save-images:
	@echo "Saving Docker images..."
	@docker save -o $(IMG_DIR)/wordpress.tar srcs_wordpress:latest
	@docker save -o $(IMG_DIR)/nginx.tar srcs_nginx:latest
	@docker save -o $(IMG_DIR)/mariadb.tar srcs_mariadb:latest