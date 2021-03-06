﻿<!---
   Copyright 2010 Mark Mandel
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
       http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 --->

<cfcomponent hint="Parser for managing <alias> tags" extends="coldspring.beans.xml.AbstractBeanDefinitionParser" output="false">

<cfscript>
	instance.static = {};
	instance.static.ALIAS_ATTRIBUTE = "alias";
	instance.static.NAME_ATTRIBUTE = "name";
</cfscript>

<!------------------------------------------- PUBLIC ------------------------------------------->

<cffunction name="init" hint="Constructor" access="public" returntype="AliasBeanDefinitionParser" output="false">
	<cfscript>
		super.init();

		return this;
	</cfscript>
</cffunction>

<cffunction name="parse" hint="Registers an alias with the BeanDefinitionRegistry for each <alias> tag it encounters"
			access="public" returntype="any" output="false">
	<cfargument name="element" hint="a instance of org.w3c.dom.Element that represent the XML Element" type="any" required="Yes">
	<cfargument name="parserContext" hint="the current parser context" type="coldspring.beans.xml.ParserContext" required="Yes">
	<cfscript>
		var alias = arguments.element.getAttribute(instance.static.ALIAS_ATTRIBUTE);
		var name = arguments.element.getAttribute(instance.static.NAME_ATTRIBUTE);

		arguments.parserContext.getBeanDefinitionRegistry().registerAlias(name, alias);
    </cfscript>
</cffunction>

<!------------------------------------------- PACKAGE ------------------------------------------->

<!------------------------------------------- PRIVATE ------------------------------------------->

</cfcomponent>