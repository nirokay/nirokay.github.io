import std/[strformat]
import websitegenerator

var html: HtmlDocument = newDocument("index.html")

html.addToHead(
    stylesheet("styles.css"),
    icon("./resources/img/favicon.gif", "image/gif", "32x32"),
    charset("utf-8"),
    viewport("width=device-width, initial-scale=1"),

    title("nirokay's homepage"),
    description("Simple homepage, nothing special.")
)

proc imageLink(link, imagePath, imageAlt: string): HtmlElement =
    let img: HtmlElement = img(imagePath, imageAlt).setClass("containerimage")
    result = a(link, $img)

proc blob(elements: varargs[HtmlElement]): HtmlElement =
    `div`(elements).setClass("blob")

proc smallblob(elements: varargs[HtmlElement]): HtmlElement =
    `div`(elements).setClass("smallblob")

proc container(elements: varargs[HtmlElement]): HtmlElement =
    `div`(elements).setClass("container")

proc codeDoc(name, desc: string): HtmlElement =
    let
        link = &"./nim-docs/{name}/{name}.html"
        header: HtmlElement = newElement("h3", $a(link, name))
        description: HtmlElement = p($b(name) & " " & desc)
    smallblob(header, description)

html.addToBody(
    h1("nirokay's basic homepage"),
    p(
        "Hi! This is my simple little homepage. " &
        "Here you can find some links to my projects " &
        "or anything related to some! :)"
    ).setClass("center"),
    blob(
        h2("Links"),
        container(
            imageLink(
                "https://github.com/nirokay",
                "./resources/img/github.svg",
                "Github"
            ),
            imageLink(
                "https://cohost.org/nirokay",
                "./resources/img/cohost.svg",
                "CoHost"
            ),
            imageLink(
                "https://discordapp.com/users/279697404259991552",
                "./resources/img/discord-mark-white.svg",
                "Discord"
            )
        )
    ),

    blob(
        h2("Code Docs"),
        codeDoc("nimcatapi", "is a library that lets you easily request images from thecatapi and/or thedogapi."),
        codeDoc("nimegenerator", "is a library-binary hybrid, which lets you create randomly generated names/words."),
        codeDoc("cardgenerator", "is a cli tool, that lets you create playing-cards from minimal resources."),
        codeDoc("websitegenerator", "is a Nim library to generate static html/css. This site is generated using it!")
    ),

    blob(
        h2("Very important random cat picture!!"),
        img(
            "https://api.thecatapi.com/v1/images/search?format=src&size=full",
            "you are missing out on a really cool cat picture... :("
        ).setClass("center")
    )
)

html.writeFile()
