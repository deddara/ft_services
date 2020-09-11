.PHONY: build

build:
	docker build -t ft_services .

.PHONY: run
	
run:
	docker run --name ft_services -p 80:80 -p 443:443 -it -d ft_services:latest

.PHONY: exec
exec:
	docker exec -it ft_services bash