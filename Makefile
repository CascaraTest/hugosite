build:
	rm -rf public
	hugosite
	
deploy: build
	aws s3 sync public/ s3://www.imquartier.live --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E28MALY64QVW8C --paths '/*'
	