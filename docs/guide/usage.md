# 关于此网页后台的一些操作方法（仅供自己参考）

## 对于单独文件更新后推送到网页的操作：
```powershell
——git add docs/文件名字.md
git commit -m "更新：XXX 文档内容"
git push
mkdocs gh-deploy
```


## 一键更新并触发部署
```powershell
# 一键检测本地 docs/ 与配置改动，提交并推送到 main 分支
git pull origin main; `
git add docs/ mkdocs.yml; `
git commit -m "更新：<填写本次改动说明>"; `
git push origin main
```

## 一些markdown的用法链接
更多关于 Markdown 代码块语法高亮的用法，参阅 [Syntax Highlighting in Markdown Code Blocks](https://elischei.com/syntax-highlighting-in-markdown-code-blocks/)。

