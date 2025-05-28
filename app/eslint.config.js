export default [
  {
    ignores: ["**/node_modules/**"]
  },
  {
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "module",
      ecmaVersion: "latest"
    },
    rules: {
      "quotes": ["error", "single"],
      "semi": ["error", "always"],
      "indent": ["error", 2]
    }
  }
];