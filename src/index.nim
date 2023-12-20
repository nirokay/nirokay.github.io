import std/[strformat]
import websitegenerator
import ./resources, ./styles

var html: HtmlDocument = newDocument("index.html")

html.setStyle(css)

html.addToHead(
    icon("./resources/img/favicon.gif", "image/gif", "32x32"),
    charset("utf-8"),
    viewport("width=device-width, initial-scale=1"),

    title("nirokay's homepage"),
    description("Simple homepage, nothing special.")
)

proc linkImage(link, imagePath, imageAlt: string): HtmlElement =
    let img: HtmlElement = img(imagePath, imageAlt).setClass(classContainerimage)
    result = a(link, $img)

proc blob(elements: varargs[HtmlElement]): HtmlElement =
    `div`(elements).setClass(classBlob)

proc smallblob(elements: varargs[HtmlElement]): HtmlElement =
    `div`(elements).setClass(classSmallblob)

proc container(elements: varargs[HtmlElement]): HtmlElement =
    `div`(elements).setClass(classContainer)


proc codeDoc(language: ProgrammingLanguage, name, desc: string): HtmlElement =
    let
        link = &"./nim-docs/{name}/{name}.html"
        image: HtmlElement = img($language, "Language").add(
            attr("width", "50rem")
        )
        header: HtmlElement = h3($a(link, name) & " " & $image)
        description: HtmlElement = p(
            $b(name) & " " & desc & $br() &
            $a("https://github.com/nirokay/" & name, $small($u(">> Source code <<")))
        )
    smallblob(header, description)

proc codeShowcase(language: ProgrammingLanguage, name, desc: string): HtmlElement =
    let
        image: HtmlElement = img($language, "Language").add(
            attr("width", "50rem"),
            attr("max-width", "2px")
        )
        header: HtmlElement = h3(name & " " & $image)
        description: HtmlElement = p(
            $b(name) & " " & desc & $br() &
            $a("https://github.com/nirokay/" & name, $small($u(">> Source code <<")))
        )
    smallblob(header, description)

html.addToBody(
    h1("nirokay's basic homepage"),
    p("Hi! This is my simple little homepage. :)").setClass(classCenterText),
    p("You will find links to my projects here.").setClass(classCenterText),
    p($small("As well as other stuff, that I think of putting here...")).setClass(classCenterText),
    blob(
        h2("Links"),
        container(
            linkImage(
                "https://github.com/nirokay",
                imagelink.github,
                "Github"
            ),
            linkImage(
                "https://cohost.org/nirokay",
                imagelink.cohost,
                "CoHost"
            ),
            linkImage(
                "https://discordapp.com/users/279697404259991552",
                imagelink.discord,
                "Discord"
            )
        )
    ),

    blob(
        h2("Code Docs"),
        Nim.codeDoc("nimcatapi", "is a library with which you can easily request images from thecatapi and/or thedogapi."),
        Nim.codeDoc("nimegenerator", "is a library-binary hybrid, which lets you create randomly generated names/words."),
        Nim.codeDoc("cardgenerator", "is a cli tool which lets you create playing-cards from minimal resources."),
        Nim.codeDoc("websitegenerator", "is a library that allows you to generate static html/css. This site is actually generated using it!!"),
        Nim.codeDoc("docchanger", "is an application that automates generating repetitive documents. Useful for meetings and meeting-summaries."),
        Nim.codeDoc("hzgshowaround", "is a builder for the <a href='https://nirokay.github.io/HzgShowAround'>HzgShowAround</a> website.")
    ),

    blob(
        h2("Other projects I am proud of"),
        Nim.codeShowcase("Brainimfuck", "is a Brainfuck interpreter with some advanced features, such as syntax checking and highlighting errors."),
        Nim.codeShowcase("gitman", "is a cross-platform git repository manager. Easily keep track of your cloned repositories."),
        Lua.codeShowcase("FloppyBird", "is yet another open-source Flappy Bird clone (please don't sue me) written in Lua, using the Löve2d Game Engine.")
    ),

    blob(
        h2("Very important random cat picture!!"),
        img(
            imagelink.randomCat,
            "you are missing out on a really cool cat picture... :("
        ).setClass(classCenterSmallImage)
    )
)

html.writeFile()
