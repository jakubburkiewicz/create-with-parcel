### Setup ###
```
curl -fsSL https://raw.githubusercontent.com/midnightcodr/create-with-parcel/master/setup.sh | bash -s myProject
```

Note: replace `myProject` with your actual project name.

To enable HMR, please uncomment the following code in `src/index.js`

```javascript
/* if (module.hot) {
  module.hot.accept();
} */
```

To open a browser after parcel runs:

```
npm start -- --open
```
