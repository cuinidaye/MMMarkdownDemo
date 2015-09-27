>前言：MMMarkdown是一个可以将Markdown文本解析成HTML的Objective-C框架，它的使用环境是OS X 10.6+ 和 iOS 8.0+。MMMarkdown的Github页面在[这里](https://github.com/mdiep/MMMarkdown)。我自己写了一个Demo,也放在了Github上，[MMMarkdownDemo](https://github.com/cuinidaye/MMMarkdownDemo)。

##（一）安装
1，
如果你正在使用 [Carthage](https://github.com/Carthage/Carthage),那就很简单了:
>github "mdiep/MMMarkdown"

2，
我一直用的是CocoaPod，没有安装Carthage，所以只能手工导入了。

*   先把`MMMarkdown.xcodeproj`添加到你的工程里
*   然后`“Build Phases”` -->`"Link Binary with Libraries"`-->Add `MMMarkdown.framework`


##（二）使用
MMMarkdown使用起来非常简单，使用之前先导入`import <MMMarkdown/MMMarkdown.h>`即可。

```
NSError  *error;
NSString *markdown   = @"# Example\nWhat a library!";
NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:markdown error:&error];
// Returns @"<h1>Example</h1>\n<p>What a library!</p>"
```

另外，`MMMarkdown`也支持很多扩展，这些扩展我也没有一一去尝试，大家可以自己去试一下：

```
NSString *markdown   = @"~~Mistaken~~";
NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:markdown extensions:MMMarkdownExtensionsGitHubFlavored error:NULL];
// Returns @"<p><del>Mistaken</del></p>"
```

##（三）注意事项
`MMMarkdown`这个库好像不能解析代码片段，就是说解析不了这个[```](https://github.com/cuinidaye/MMMarkdownDemo)符号，但是我们将要做的项目好像也不需要解析代码，就这么着吧。


*   Red
*   Green
*   Blue