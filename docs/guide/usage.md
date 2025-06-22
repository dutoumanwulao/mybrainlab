# 关于此网页后台的一些操作方法（仅供自己参考）

对于本网站更新后把本地文档在Terminal上载到网页端的操作如下：

——git add docs/文件名字.md
git commit -m "更新：XXX 文档内容"
git push

mkdocs gh-deploy

## 一键更新并触发部署
git add docs/ mkdocs.yml && \
git commit -m "更新：完善指南和操作用法文档" && \
git push
