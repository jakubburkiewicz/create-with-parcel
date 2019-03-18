if [ $# -lt 1 ]; then
    echo "Please provide project name"
    exit 0
fi
project=$1
if [ -e $project ]; then
    echo "object $project already exists"
    return
fi
mkdir -p $project/src
cd $project
cat << EOL > src/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <div id="root"></div>
    <script src="./index.js"></script>    
</body>
</html>
EOL
cat << EOL2 > src/index.js
import React from 'react'
import ReactDOM from 'react-dom'

ReactDOM.render(<h1>Hello React</h1>, document.getElementById('root'))
EOL2
cat << EOL3 > .gitignore
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*
EOL3
yarn init -y
node -e 'var obj = require("./package.json"); obj.scripts={ start: "parcel ./src/index.html", build: "parcel build ./src/index.html/" }; console.log(JSON.stringify(obj, null, 2));' > _package.json
mv _package.json package.json
yarn add react react-dom json5
yarn add -D parcel-bundler babel-preset-react babel-preset-env babel-plugin-transform-class-properties
node -e 'var obj={presets:["env", "react"],plugins: ["transform-class-properties"]};console.log(JSON.stringify(obj, null, 2));' > .babelrc
echo "All done. To get started"
echo "cd $project; npm run dev"
