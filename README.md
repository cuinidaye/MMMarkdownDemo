>前言：MMMarkdown是一个可以将Markdown文本解析成HTML的Objective-C框架，它的使用环境是OS X 10.6+ 和 iOS 8.0+。MMMarkdown的Github页面在[这里](https://github.com/mdiep/MMMarkdown)。

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

##（三）MMMarkdown扩展
另外，`MMMarkdown`也支持很多扩展:

>  MMMarkdownExtensionsNone
>  MMMarkdownExtensionsAutolinkedURLs
>  MMMarkdownExtensionsFencedCodeBlocks
>  MMMarkdownExtensionsHardNewlines
>  MMMarkdownExtensionsStrikethroughs
>  MMMarkdownExtensionsTables
>  MMMarkdownExtensionsUnderscoresInWords
>  MMMarkdownExtensionsGitHubFlavored

其中：
```
MMMarkdownExtensionsGitHubFlavored = MMMarkdownExtensionsAutolinkedURLs
                                        |MMMarkdownExtensionsFencedCodeBlocks
                                        |MMMarkdownExtensionsHardNewlines
                                        |MMMarkdownExtensionsStrikethroughs
                                        |MMMarkdownExtensionsTables
                                        |MMMarkdownExtensionsUnderscoresInWords,
```

默认的扩展是`None`,但是使用这个扩展是解析不了代码片段的，若是需要解析代码片段，可以使用`MMMarkdownExtensionsFencedCodeBlocks`，或者直接使用`MMMarkdownExtensionsGitHubFlavored`。代码如下：

```
NSString *markdown   = @"~~Mistaken~~";
NSString *htmlString = [MMMarkdown HTMLStringWithMarkdown:markdown extensions:MMMarkdownExtensionsGitHubFlavored error:NULL];
// Returns @"<p><del>Mistaken</del></p>"
```
