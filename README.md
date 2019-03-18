### Setup ###
```
curl -fsSL https://raw.githubusercontent.com/midnightcodr/create-with-parcel/master/setup.sh | bash -s my-project
```

Note: replace `my-project` with your actual project name.

To enable HMR, please add the following code to `src/index.js`

```javascript
if (module.hot) {
  module.hot.accept();
}
```