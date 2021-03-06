<cfcomponent output="false">

	<cfscript>
		this.name = "taffy_ParentAppExample";
		this.applicationTimeout = createTimeSpan(0,2,0,0);
		this.sessionManagement = false;
		this.setClientCookies = true;
		this.scriptProtect = false;
	</cfscript>

	<cffunction name="onApplicationStart" returnType="boolean" output="false">

		<cfset application.beanFactory = createObject("component", "coldspring.beans.DefaultXMLBeanFactory") />
		<cfset application.beanFactory.loadBeans('/taffy/examples/ParentApplication/config/coldspring.xml') />

		<cfreturn true />
	</cffunction>

	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true" />

		<cfif structKeyExists(url, "reinit")>
			<cfset onApplicationStart() />
		</cfif>

		<cfreturn true />
	</cffunction>

</cfcomponent>