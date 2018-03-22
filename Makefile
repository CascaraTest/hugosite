build:
	rm -rf public
	hugo
	
deploy: build
	aws s3 sync public/ s3://imquartier.live -acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E28MALY64QVW8C --paths '/*'