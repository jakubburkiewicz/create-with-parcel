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
echo "console.log('ready')" > src/index.js
yarn init -y
node -e 'var obj = require("./package.json"); obj.scripts={ dev: "parcel ./src/index.html", build: "parcel build ./src/index.html/" }; console.log(JSON.stringify(obj, null, 2));' > _package.json
mv _package.json package.json
yarn add react react-dom
yarn add -D parcel-bundler babel-preset-react babel-preset-env
node -e 'var obj={presets:["env", "react"]};console.log(JSON.stringify(obj, null, 2));' > .babelrc
echo "All done. To get started"
echo "cd $project; npm run dev"