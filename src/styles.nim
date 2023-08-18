import std/[tables]
import websitegenerator

var css*: CssStyleSheet = newCssStyleSheet("styles.css")

let
    textCenter = ["text-align", "center"]
    textUnderline = ["text-decoration", "underline"]
    textNoDecoration = ["text-decoration", "none"]
    textTransparentBackground = ["background-color", "transparent"]

proc elem(name: string, attributes: varargs[array[2, string]]): CssElement =
    newCssElement(name, attributes)
proc class(name: string, attributes: varargs[array[2, string]]): CssElement =
    newCssClass(name, attributes)
proc link(which, colour: string): CssElement =
    elem("a:" & which,
        ["color", colour],
        textNoDecoration,
        textTransparentBackground
    )

proc border(size: string): array[2, string] =
    ["border", size & " ridge rgba(69, 69, 69, 0.5)"]

# Html elements:
css.add(
    elem("body",
        ["background-color", "rgb(23, 25, 33)"],
        ["color", "white"],
        ["font-family", "Verdana, Geneva, Tahoma, sans-serif"]
    ),

    elem("h1", textCenter, textUnderline),
    elem("h2", textUnderline),
    elem("h3", textUnderline),

    link("link", "pink"),
    link("visited", "hotpink"),
    link("hover", "deeppink"),
    link("active", "darkmagenta")
)


# Classes:
let
    classCenter* = class("center",
        ["display", "block"],
        ["margin-left", "auto"],
        ["margin-right", "auto"],
        ["width", "50%"]
    )

    classBlob* = class("blob",
        textCenter,
        ["margin", "25px"],
        ["padding", "10px"],
        border("20px")
    )
    classSmallblob* = class("smallblob",
        textCenter,
        ["display", "inline-table"],

        ["margin", "5px"],
        ["padding", "5px"],
        border("10px")
    )

    classContainer* = class("container",
        textCenter
    )
    classContainerimage* = class("containerimage",
        ["display", "inline-block"],
        ["margin", "5px 5px"],
        ["padding", "5px"],
        ["width", "5rem"]
    )

var classCenterText* = classCenter
classCenterText.properties["text-align"] = "center"
classCenterText.properties["width"] = "75%"

var classCenterSmallImage* = classCenter
classCenterSmallImage.properties["width"] = "25rem"
classCenterSmallImage.properties["max-width"] = "70%"

css.add(
    classCenter, classCenterText,
    classBlob, classSmallblob,
    classContainer, classContainerimage, classCenterSmallImage
)

css.writeFile()
