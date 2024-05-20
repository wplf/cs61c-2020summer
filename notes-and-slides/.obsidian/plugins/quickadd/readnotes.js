const quickaddApi = app.plugins.plugins.quickadd.api;
async function start(e, t) {
  // 获取当前正在看pdf文件数据结构
  const file = app.workspace.getActiveFile();
  // 获取文件名字
  const fileName = file.basename;
  // 设置基础文件夹
  const baseFolder = "Area-阅读批注";
  // 每本书对应的文件夹
  const notesFolderPath = baseFolder + "/" + fileName;

  // 不存在书对应文件夹时创建文件夹
  const hasFolder = await app.vault.adapter.exists(notesFolderPath);
  if (!hasFolder) {
    await app.vault.createFolder(notesFolderPath);
  }

  // 获取选中的文字
  let txt;
  if (document.selection) {
    //判断是否是ie浏览器
    txt = document.selection.createRange().text; //ie浏览器
  } else {
    txt = document.getSelection().toString(); //其他浏览器
  }
  // 文字处理
  let txts = txt.split("\n");
  txts = txts.map((line) => {
    return `> ${line}`;
  });
  // 获取当前页数
  const pageNumInput = document.querySelector(".pdf-page-input").value.trim();
  const pageNum = document
    .querySelector("span.pdf-page-numbers")
    .innerText.split("of")[0]
    .replace("(", "")
    .trim();

  const backlink =
    pageNum !== null && pageNum !== ""
      ? `> [[${fileName}.pdf#page=${pageNum}]]`
      : `> [[${fileName}.pdf#page=${pageNumInput}]]`;
  txts.push(backlink);
  txt = txts.join("\n");

  // 文字再编辑
  const notes = await quickaddApi.wideInputPrompt(
    "阅读批注",
    "写下阅读中的思考",
    txt
  );
  if (!notes) return;
  let title = await quickaddApi.inputPrompt(
    "阅读批注标题为？",
    `默认为文件创建时间，如${quickaddApi.date.now(
      "YYYY-MM-DD-HH-mm-ss"
    )}  阅读批注`
  );
  title = title
    ? title
    : quickaddApi.date.now("YYYY-MM-DD-HH-mm-ss") + " 阅读批注";
  await app.vault.create(notesFolderPath + "/" + title + ".md", notes);
  new Notice("阅读批注创建成功");
}
module.exports = {
  entry: start,
  settings: {
    name: "readnotes",
    author: "ZhiJiu",
    options: {},
  },
};