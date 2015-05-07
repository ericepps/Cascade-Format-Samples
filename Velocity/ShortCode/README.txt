These Velocity macros build on the "Bricks" concept to bring a WordPress-style ShortCode functionality
to include an XHTML or Text block as a replacement.

ShortCode Usage: 
	[xhtmlBlock path="/absolute/path/to/block" site="siteName"]
	[textBlock path="/absolute/path/to/block" site="siteName"]

Macros can be added to existing Velocity formats to implement the ShortCode. To call the macros, just pass
a serialized copy of HTML (e.g. WYSIWYG content) to the macro like:
    #set ( $content = $_SerializerTool.serialize($wysiwyg,true) )
    #xhtmlBlock ($content)
    #textBlock ($content)
	$content
