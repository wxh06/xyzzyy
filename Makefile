test: npm-test pycodestyle

npm-test: htmlhint eslint

htmlhint:
	htmlhint .

eslint:
	eslint .

pycodestyle:
	pycodestyle .
