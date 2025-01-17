const db = require("mime-db");
const fs = require("fs");
const path = require("path");

/**
 * @type {Map<string, string>}
 */
const mimeTypesFromExtension = new Map();

Object.entries(db).forEach(([key, value]) => {
  if (value.extensions) {
    value.extensions.forEach((ext) => {
      if (!mimeTypesFromExtension.has(ext))
        mimeTypesFromExtension.set(ext, key);
    });
  }
});

fs.writeFileSync(
  path.join(__dirname, "../hx_webserver/HTTPMimeDb.hx"),
  `// THIS FILE IS AUTOGENERATED, run \`npm run generate-mime-types\` to update
package hx_webserver;
class HTTPMimeDb {
    public static final mimeTypes:Map<String, String> = [
${Array.from(mimeTypesFromExtension.entries())
  .map(([ext, mimeType]) => `        "${ext}" => "${mimeType}"`)
  .join(",\n")}
    ];
}`
);
