{**
 * templates/frontend/pages/subscriptions.tpl
 *
 * Copyright (c) 2013-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal Subscriptions.
 *
 *}

{include file="frontend/components/header.tpl" pageTitle="about.subscriptions"}

<div class="page page_subscriptions">
	<div class="container-fluid container-page">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.subscriptions"}
		{include file="frontend/components/subscriptionContact.tpl"}

		<a name="subscriptionTypes"></a>
		{if !$individualSubscriptionTypes->wasEmpty()}
			<div class="subscriptions_institutional">
				<h3 class="subscriptions-heading"><span>{translate key="about.subscriptions.individual"}</span></h3>
				<p>{translate key="subscriptions.individualDescription"}</p>
				<table class="cmp_table">
					<tr>
						<th>{translate key="about.subscriptionTypes.name"}</th>
						<th>{translate key="about.subscriptionTypes.format"}</th>
						<th>{translate key="about.subscriptionTypes.duration"}</th>
						<th>{translate key="about.subscriptionTypes.cost"}</th>
					</tr>
					{iterate from=individualSubscriptionTypes item=subscriptionType}
						<tr>
							<td>
								<div class="subscription_name">
									{$subscriptionType->getLocalizedName()|escape}
								</div>
								<div class="subscription_description">
									{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}
								</div>
							</td>
							<td>{translate key=$subscriptionType->getFormatString()}</td>
							<td>{$subscriptionType->getDurationYearsMonths()|escape}</td>
							<td>{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()|escape})</td>
						</tr>
					{/iterate}
				</table>
			</div>
			{if $isUserLoggedIn}
				<div class="subscriptions_individual_purchase">
					<a class="action" href="{url page="user" op="purchaseSubscription" path="individual"}">
						{translate key="user.subscriptions.purchaseNewSubscription"}
					</a>
				</div>
			{/if}
		{/if}

		{if !$institutionalSubscriptionTypes->wasEmpty()}
			<h3 class="subscriptions-heading"><span>{translate key="about.subscriptions.institutional"}</span></h3>
			<p>{translate key="subscriptions.institutionalDescription"}</p>
			<table class="cmp_table">
				<tr>
					<th>{translate key="about.subscriptionTypes.name"}</th>
					<th>{translate key="about.subscriptionTypes.format"}</th>
					<th>{translate key="about.subscriptionTypes.duration"}</th>
					<th>{translate key="about.subscriptionTypes.cost"}</th>
				</tr>
				{iterate from=institutionalSubscriptionTypes item=subscriptionType}
					<tr>
						<td>
							<div class="subscription_name">
								{$subscriptionType->getLocalizedName()|escape}
							</div>
							<div class="subscription_description">
								{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}
							</div>
						</td>
						<td>{translate key=$subscriptionType->getFormatString()}</td>
						<td>{$subscriptionType->getDurationYearsMonths()|escape}</td>
						<td>{$subscriptionType->getCost()|string_format:"%.2f"}&nbsp;({$subscriptionType->getCurrencyStringShort()|escape})</td>
					</tr>
				{/iterate}
			</table>
			{if $isUserLoggedIn}
				<div class="subscriptions_institutional_purchase">
					<a class="action" href="{url page="user" op="purchaseSubscription" path="institutional"}">
						{translate key="user.subscriptions.purchaseNewSubscription"}
					</a>
				</div>
			{/if}
		{/if}
	</div>
</div>

{include file="frontend/components/footer.tpl"}
