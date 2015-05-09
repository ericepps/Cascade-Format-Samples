These Velocity macros build on the "Bricks" concept to bring a WordPress-style ShortCode functionality
to include an XHTML or Text block as a replacement.

ShortCode Usage: 
	[getBlock type="xhtml" path="/absolute/path/to/block" site="siteName"]
	[getBlock type="text" path="/absolute/path/to/block" site="siteName"]

Macro can be added to existing Velocity formats to implement the ShortCode. To call the macro, just pass
a serialized copy of HTML (e.g. WYSIWYG content) to the macro like:
#set ( $content = $_SerializerTool.serialize($wysiwyg, true) )
#getBlock($content)
${content}
