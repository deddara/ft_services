.PHONY: build

build:
	docker build -t ft_wp .

.PHONY: run
	
run:
	docker run --name ft_wp -p 5050:5050 -p 9000:9000 -it -d ft_wp:latest

.PHONY: exec
exec:
	docker exec -it ft_wp sh