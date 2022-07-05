setup/continuous-release:
	cd scripts && chmod +x continuous_release.sh && ./continuous_release.sh
run/continuous-release:
	npx semantic-release
