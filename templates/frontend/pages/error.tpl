{**
 * templates/frontend/pages/error.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2000-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Generic error page.
 * Displays a simple error message and (optionally) a return link.
 *}

{include file="frontend/components/header.tpl"}

<div class="page page_error">
	<div class="container-fluid container-page">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
		<div class="error-description">
			<p>{translate key=$errorMsg params=$errorParams}</p>
		</div>
		{if $backLink}
			<div class="cmp_back_link">
				<a href="{$backLink}">{translate key=$backLinkLabel}</a>
			</div>
		{/if}
	</div>
</div>

{include file="frontend/components/footer.tpl"}
