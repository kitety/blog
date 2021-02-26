"use strict";

const fs = require("fs");
const path = require("path");
const yaml = require("js-yaml");
const should = require("chai").should();

const yamlLoad = yaml.load || yaml.safeLoad;
describe("Validate", () => {
  it("config", () => {
    const themeConfig = fs.readFileSync(
      path.join(__dirname, "../../_config.yml")
    );
    should.not.throw(() => {
      yamlLoad(themeConfig);
    });
  });

  it("vendors", () => {
    const vendorsFile = fs.readFileSync(
      path.join(__dirname, "../../_vendors.yml")
    );
    should.not.throw(() => {
      yamlLoad(vendorsFile);
    });
  });

  it("language", () => {
    const languagesPath = path.join(__dirname, "../../languages");
    should.not.throw(() => {
      fs.readdirSync(languagesPath).forEach((lang) => {
        if (!lang.endsWith(".yml")) return;
        const languagePath = path.join(languagesPath, lang);
        yamlLoad(fs.readFileSync(languagePath), {
          filename: path.relative(__dirname, languagePath),
        });
      });
    });
  });
});
