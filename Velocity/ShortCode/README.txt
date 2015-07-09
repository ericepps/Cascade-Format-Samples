These Velocity macros build on the "Bricks" concept to bring a WordPress-style ShortCode functionality
to include an XHTML or Text block as a replacement.

ShortCode Usage: 
	[getBlock type="xhtml" path="/absolute/path/to/block" site="siteName"]
	[getBlock type="text" path="/absolute/path/to/block" site="siteName"]
	
	With text replacement:
	[getBlock type="xhtml" path="/absolute/path/to/block" site="siteName" replace="textreplacement1 textreplacement2" textreplacement1="value to display #1"  textreplacement2="value to display #2"]
	 - will replace the string "[|[textreplacement1]|]" in the block with "value to display #1" and "[|[textreplacement2]|]" with "value to display #2"
	 - beware of quotes!

Macro can be added to existing Velocity formats to implement the ShortCode. To call the macro, just pass
a serialized copy of HTML (e.g. WYSIWYG content) to the macro like:
#set ( $content = $_SerializerTool.serialize($wysiwyg, true) )
#getBlock($content)
${content}
