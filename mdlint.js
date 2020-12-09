const fs = require("fs");
const path = require("path");
const { exec } = require("child_process");

// 读取全部文件
let mds = fs.readdirSync(path.join("./source/_posts"));
let hacChanged;
mds = mds.map((md) => {
  return new Promise((resolve, reject) => {
    try {
      const filePath = path.join("./source/_posts", md);
      content = fs.readFileSync(filePath, "utf-8");
      // 有不规范的图床内容
      if (content.indexOf("cdn.jsdelivr.net/gh/kitety/blog_img/") > -1) {
        hacChanged = true;
        // 替换 添加@master
        content = content.replace(
          /cdn.jsdelivr.net\/gh\/kitety\/blog_img\//g,
          "cdn.jsdelivr.net/gh/kitety/blog_img@master/"
        );
        // 写入到文件
        fs.writeFileSync(filePath, content);
      }
      resolve();
    } catch (e) {
      reject(e);
    }
  });
});

Promise.all(mds).then(
  () => {
    // 有文件修改
    if (hacChanged) {
      exec("git add .", (err, stdout) => {
        if (err) {
          console.log("重新 git add 失败");
          process.exit(1);
        }
        console.log("文件已经修改，请重新提交");
        process.exit(1);
      });
    }
  },
  (error) => {
    console.log(error);
    // 退出进程，不再commit文件
    process.exit(1);
  }
);
