# 贵州大学本科毕业论文 LaTeX 模板

这是一个非官方的贵州大学本科毕业论文（设计）LaTeX 模板，依据本地 Word 样表和毕业论文排版要求整理，适合用 XeLaTeX 编译。

> 学校或学院若下发新的官方模板，请以官方文件为准。本仓库只提供排版参考和可复用的 LaTeX 骨架。

## 致谢与来源说明

本模板整理过程中参考并致谢上一届学长维护的 `GZUbachelorthesis` 模板，尤其是封面、诚信责任书和页眉的 LaTeX 布局思路。本仓库没有直接基于该模板类文件二次开发，而是在当前论文实践稿基础上整理出一份独立、可替换的模板骨架。

格式依据主要来自：

- `requirements/贵州大学毕业论文（设计）管理办法（试行）.pdf`
- `word_templates/封面及承诺书.docx`
- `word_templates/论文封面.docx`
- `word_templates/诚信责任书.docx`

其中，LaTeX 原生封面和诚信责任书尽量参照上一届学长模板的版面布局，同时结合本仓库附带的学校 Word 样表微调。若二者有差异，建议优先使用学校 Word 模板导出 PDF 后插入。

## 功能

- A4 纸张，页边距：上 30 mm、下 25 mm、左 30 mm、右 20 mm
- 正文小四字号，固定 20 pt 基线距，首行缩进 2 字符
- 章节标题：章标题居中黑体小三，节标题黑体四号，小节标题黑体小四
- 中文字体使用宋体/黑体，英文和数字使用 Times New Roman
- 页眉包含校徽、“贵州大学本科毕业论文（设计）”和“第 N 页”
- 目录点引导线已调为接近 Word 自动目录的紧密效果
- 支持中文摘要、英文摘要、致谢、附录
- 支持 `refs.bib` + `gbt7714-numerical` 生成 GB/T 7714 风格参考文献
- 默认用 LaTeX 生成封面与诚信责任书，也支持插入 Word 导出的封面 PDF

## 目录结构

```text
.
├── main.tex
├── refs.bib
├── assets/
│   ├── cover_logo.png
│   └── cover_wordmark.png
├── chapters/
│   ├── 01_introduction.tex
│   ├── 02_body.tex
│   ├── 03_conclusion.tex
│   └── appendix.tex
├── tools/
│   └── compile.ps1
├── word_templates/
│   ├── 封面及承诺书.docx
│   ├── 论文封面.docx
│   └── 诚信责任书.docx
├── requirements/
│   └── 贵州大学毕业论文（设计）管理办法（试行）.pdf
├── .latexmkrc
├── .gitignore
└── LICENSE
```

## 使用方法

1. 修改 `main.tex` 中“用户信息”区域：

```tex
\newcommand{\thesistitle}{论文题目}
\newcommand{\covertitlefirst}{论文题目第一行}
\newcommand{\covertitlesecond}{论文题目第二行}
\newcommand{\college}{学院名称}
\newcommand{\major}{专业名称}
\newcommand{\majorcode}{专业代码}
\newcommand{\classinfo}{班级名称}
\newcommand{\studentid}{学号}
\newcommand{\studentname}{学生姓名}
\newcommand{\supervisor}{指导教师}
```

2. 替换 `chapters/` 中的示例章节。

3. 在 `refs.bib` 中维护参考文献。

4. 编译：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/compile.ps1
```

需要清理辅助文件后重新编译时：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File tools/compile.ps1 -CleanAux
```

也可以使用 `latexmk`：

```powershell
latexmk -xelatex main.tex
```

Windows 下若出现 `SimHei` 粗体字形缺失警告，通常是 XeLaTeX 将黑体粗体替换为普通黑体，不影响 PDF 正常生成。若学校或学院对字重有严格要求，可自行指定其他可用黑体字体。

## 封面与诚信责任书

模板默认用 LaTeX 原生方式生成封面和诚信责任书：

```tex
\usefrontmatterpdffalse
```

该原生版封面和诚信责任书参考了上一届学长模板的布局，并结合本仓库附带的 Word 样表调整。它适合快速生成完整论文示例或日常预览。

正式提交时，更稳妥的方式是编辑 `word_templates/封面及承诺书.docx`，导出为 PDF，并把 PDF 放到：

```text
assets/front_matter_cover_statement.pdf
```

然后在 `main.tex` 中改为：

```tex
\usefrontmatterpdftrue
```

如果学院要求封面与诚信责任书分开维护，也可以分别编辑 `word_templates/论文封面.docx` 与 `word_templates/诚信责任书.docx`，再合并导出为上述 PDF。

## 上传 GitHub 建议

建议上传源码文件，不上传生成物：

- 不上传：`main.pdf`、`main.docx`、`*.aux`、`*.bbl`、`*.log`、`*.toc`
- 不上传：个人论文正文、实验数据、未授权图片、签名页扫描件
- 上传前请再次检查 `main.tex` 中是否仍包含个人姓名、学号、导师、论文题目等信息

## 许可

模板采用 LaTeX Project Public License 1.3c。校徽、校名字标等资源仅用于论文排版学习与个人毕业论文写作，请遵守学校标识使用规范。
