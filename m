Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3271606A31C
	for <kvm-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gt0vgWC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=UASr274t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u3mTHAQsNgkYOllPPbP7YkXdMaO1nt03IK7Ilb8FcKg=; b=3gt0vgWCgQsKIXMIA2vQtXmd6N
	ijwInMW1i0p8jPcAjkzwnfeCxh1rOZVTfMFc0Mqn74GJkxQNNiRFgtzZXAEnjgphpWV2a8FL9/JS7
	FSokGJGetDsbyxO6vDJJhuW64L6UG4iM7gfKO2Afsuwu6mM9C5jYVOwPIJEVGnl2NA+meyOoI195O
	kHCjd5qxiQPDHiQYfnhgvfiqyoI7MPVMx+lfkYnwFqzutcpsZSQFJVH0z1XMuX5YcjcRNbTpu4ilG
	BhW2qiwPoy6Fx6rS1U9nDdwuogXbke4hcYtL95QYBs/l8uc1Sb999otn3eA3txDchNDZ7/QXBYdeF
	ZmITrYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDeP-00000004mZZ-1z5t;
	Tue, 17 Nov 2026 07:30:45 +0000
Received: from mail-koreacentralazolkn19013079.outbound.protection.outlook.com ([52.103.74.79] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDeM-00000004mZ3-3JGO
	for kvm-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 07:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFYMdtSFeQVl+d86TFJL5lI4BEIH9Fzzi1JPj4Ml5aPAd6z2J4RVvDjDkLp6gSfr7pTVD8T9Gz27C9NLiITsF6X68ihngtjTnDF8DqCj6DjTZCRybaho1M/Nh7Zc3AuDAJGwljYiv7LMFi4qHOXpfNA9hLBdkLN3y8evqsJ4w1xIIkAWuCUU7wpi2ZEL9TYVjrs0VLPRRnpwopUfSxGUWsSQrnPVwfWyM1XLQs8Sw1MRTsjwnn/UJS0bin0BxUl3gw4GxDiuMg6jI4uU0S32FAYZ4QkybLTDhW5LD5Wu57mUUiGm1AMhnmvTK83WyYG1A9Al8I94ioCkGLKR/ACjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNdlUlQGQq1QwIxx6VJ8cx36AJjWOB1b7pYWdfSOJQw=;
 b=VtGPCDqA2KAVKgi91X09LWN64rEE55GnOpEYXiJ5UaxxEQUJ7jRT3EiJeLgIsT2Jr8LlM96mr3s0fLsNd6+qNFyvMInIm3JBTT7ZUT6lfdeAddBxBGSP76fDhzL2b2th2T9Mc+jN43TyZdcsH3fxhMkC9B0zdMW22k6+MTYa5djB2JF3xlcrw/dlRb+V23u0DTfj05PPBXuso63/vZrqZzp9f9mw/Srsr9DTQzsAir914ASwztoOb4ZWdtFegjpglh99p17aa1GqEiLyjgKliPSHAbrjB2C6aRjQrJ5qi1hHUNK+Wj53XrVQT1YmJtD0xTYeq7UsWOB3UUrGjRVzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNdlUlQGQq1QwIxx6VJ8cx36AJjWOB1b7pYWdfSOJQw=;
 b=UASr274tv+48JV68+SuzSEbAs8fP9RjLOTvYy7oxFtvuVAbwwm7eQvEHeJnVm3bjcaOrt4zPB5t2PIeJwJJibAGs+nIvB3GcMdC4KdIsBo/BpTDfiQsRpYPAoJ0tPCV7mzmXH/3E75hLfqN9zV13o6AKjv7phlHxWTr5ThJOf6Vz1XUvNSFPEG+8kqruVXeyNyvMErBWR8/7wqTs8a5HbEYrEb9bNfBpa3S5HjMf7WLp1nqRebvNrXQsYhnOair0B2ylNPj6BdX12RMsORI/nWmDc2Fih92NVUcloWGEJCG+NN3j6B2hwyXEOIT0RvUmJEc9vTx3PTByHCc62JtaFQ==
Received: from TYZPR04MB7491.apcprd04.prod.outlook.com (2603:1096:405:40::7)
 by SEZPR04MB6934.apcprd04.prod.outlook.com (2603:1096:101:ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:30:32 +0000
Received: from TYZPR04MB7491.apcprd04.prod.outlook.com
 ([fe80::a450:2576:3b21:6230]) by TYZPR04MB7491.apcprd04.prod.outlook.com
 ([fe80::a450:2576:3b21:6230%3]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 07:30:32 +0000
Message-ID: <TYZPR04MB749186404C06CB553C636645F37B2@TYZPR04MB7491.apcprd04.prod.outlook.com>
Date: Tue, 17 Nov 2026 15:30:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH kvmtool] riscv: Place the FDT after the kernel's
 image_size
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 will@kernel.org, julien.thierry.kdev@gmail.com
Cc: kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>
References: <20261019144304.2678066-1-andrew.jones@linux.dev>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20261019144304.2678066-1-andrew.jones@linux.dev>
X-ClientProxiedBy: JH0PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:990:4::8) To TYZPR04MB7491.apcprd04.prod.outlook.com
 (2603:1096:405:40::7)
X-Microsoft-Original-Message-ID: <bd088839-7fdf-4eb0-bee7-5ee53b66fb59@hotmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR04MB7491:EE_|SEZPR04MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: a97b6e1e-27d7-47fb-7c93-08df447ca975
X-MS-Exchange-SLBlob-MailProps: Cq7lScuPrnrlC5lHdFGci+YUsdS3F/CILV2WbCyqLjzqIGyptqvUmnrmokU1/7dqtn+2rQtwyxjVRTAFZPeiL6+hL+GKRxNUlc/p77p+3EOcb3YyIxjWJqqjIbICuIHn9qKBqg+bJjPEvhT99Pt2fW78kj48gTk4T+spDcKatOUb3GbeqXzkIaLRxSoFbML984zTt4AaZzEoQkP5g2tGzsSj8TuZ95Qo20HqZOaLkszy42a/jVZDI9yMj9XdcKuMdeEiJu2N2Xncbgs49k8/78Dh7UKUAN6UH2uGkGs6tsV759QQUTBWNzxeOsjVGPsJ0RQYM05pjRhgjDk9qzt1muKX/OzTuPbQc0i1S95dSKkCBwJAciv2KiX+WjL5rrsmHXIJWS/5PPqYcPm/8yohcVva5Jb0LitcWL9Fp++Tel2S0ZDCwUOcmUViRc/ErURtxgZbJKlF9/iWM3bDkE80mpaR/2aNcEpE/A4lUqUobimnI+7UJnl3PuGqDRUR9mV0T8fUyCccVIaxJP+FmZFStNCrxzE/3JyM0Jb0G7WKgP7CITc8DIJ7UU1F9uga9HsMYdh231jR1Oq3mCSL0Ly+xH+8BwyD/E2CxdJB1CuB9si3+0YVoBEK8YkFxBGqfoz+Ei0wWAzYMNo33lx4koGHb1Sk3Fv6PeZzgNPiJv7Tucf5m3CpiD3TE1sXmgXQbMpFx7rAKIw5NCFKCelOFSyfpC8rbmLoV4nyCPODq0MEmbRKkZ1ZHkdEjzvdvlHQj+KbFlspmJaENHE=
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|25010399006|41001999006|19110799012|8060799015|24121999003|55001999006|15080799012|19101099003|23021999003|22091999003|4140399003|5072599009|52005399003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0xFOUlnUVdaUVc0bk8zY0gxWDJUTGdpMEp4ODlOWnhicElFekV3emFGamJo?=
 =?utf-8?B?R0ZGc0F1S2wxL0NMQW0yVnk3Y01oRmEwU0VSVUJGQzI0WURMSVM5NWgrL1Rv?=
 =?utf-8?B?Mi9QZWpxTlVibXJQSHRZcnNFVWRBZDVPcmhDRmE2NFJ2bW5neGZrL29FOVFi?=
 =?utf-8?B?YWFWQkZYY2pleExkQzBtQlkxREJSNnZHTGNBR1VhTmRaTEovT0NTc3kvcWFo?=
 =?utf-8?B?VGVYdmUxNk56NEYwM2Y3UE9aTmxFQlkzbm9aekpJTGZZZGVua0NrR0dxbURV?=
 =?utf-8?B?RGFDSDlHR0RpQ05NMEd5K1pOaTFUMmFQTHV4WDE1aTltZXpqU2ZVK1o5dWI4?=
 =?utf-8?B?NnYwNWRxLzJZazF4K3RIQ1dZQytOMEQ4T2xGVDR2VXVQcXkwNG5LWU95Zjhn?=
 =?utf-8?B?VnJ0cEN1eFpIRG9ZYnNDTG54NWJsbFVhOEIxTUNxRVJwQUN6QkhrblBEOEhF?=
 =?utf-8?B?Y0crbVdXS1RvM1hobzVkemdDWnF3TnUxMVd2d1Z5MWIxbXBwWloyeWt0dTA0?=
 =?utf-8?B?WUlRYUJuTHFJb3cwVUU1UG56bGlxR05oSmFCUnoxVUN6YTFvTzJKVEZYcTdR?=
 =?utf-8?B?ZG5zT1gxKzBkZldZN0xDZ3Nad3hENGk3QVYwYzFZY240dTNjTjQxaGVmMzRq?=
 =?utf-8?B?djdvaVNkUjNSZlp2M1dlVmhTTWJDbWd5L0tMd0VCcTF6SXBHZUY3eEIzYnlN?=
 =?utf-8?B?UkM3ejBhaG8vbVk4dHAzaGwrRDhsUE9WcEdnOHM3QVZUeTViNlVEMmVEaUtS?=
 =?utf-8?B?RHkyZFJJcE54V2lDWlpQVEhTUWFwSllEQm1XNEJ4L0RDWTFXWVhIdnNiU3RR?=
 =?utf-8?B?YVhPdXMxZFZ0czMxSk91NlNOOHJoODlFdXB2czE1S29vYWpMd1E1enZUOEx2?=
 =?utf-8?B?OU0wbmdiQS9BUHh3Qlp2QUVPT1RVYlk0U0p5Vjhpb1dvdGRaMENUV3JiWndZ?=
 =?utf-8?B?UXRBdTg0RnFvV29YNmc1OHF0ZW52bkxwL1dOYjJTSVp6cW1sT2ZrTHlQdk10?=
 =?utf-8?B?ZTRXcUpTY0I4TGUxTzVrNEtGSUxjelN4NlVzN3F6RysvUjhZQ2dQNGJqVGpU?=
 =?utf-8?B?TytjVWZrRWpNZ1ZKaHZOcTFMVEtxM1JOOGlPdFdOMzJUZXkxR082ZFlHT2JH?=
 =?utf-8?B?OURRY3h1SWFuajJnQ082SUJpRlNoYUlBMTNSSEJwRnVYelNwdktzQWdFMG8x?=
 =?utf-8?B?MWhKc1Y5eTNXejJud2VQSEJJTGxCR0c4QXdyaCtsZUduUmFJbitiMUswZE1w?=
 =?utf-8?B?SDgvYW1GWGh6WFBpcGNuQ21xMlA5VWNQSDN4dGhLZ2dxYlloUXhFNCsxbU9Q?=
 =?utf-8?B?VW94S0lnbzFOcVRTZ1ZqeUZMSlNpUXdrL2hxbGREbHY5bFdVRUFDZTQxU2ZD?=
 =?utf-8?B?cDVzckpXQTBENW93dkpxa2hyZSthUm0yMU1VN2ZYRnFvMUt5T1BZTitPbUd5?=
 =?utf-8?B?ZW1SY2wvbmFzQVZVQkNpVEppMUxscExDaFhmb1JRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0haUk9YSExPN3FaYmRiRytESG5GUDFYVUdvczY3ZXNMMkdoMmt5UmM4R3Jm?=
 =?utf-8?B?L2FIYjllQ2xFelRLY3h0VExiM3dMMWFMSi9iWmkzbFh6bWdlSWxBeGlOUVdx?=
 =?utf-8?B?dWxGMG16MDBySXNYbitRMGJyeGRSNDk4cDNZVWJvVDAvK1RPQ0ZIQlk3UXAw?=
 =?utf-8?B?SWJhY3hsY09BdUNFUU1tMDh6SzQzL0xNbkRzbWJhYXZQMlc4UkFDdHU3WkxS?=
 =?utf-8?B?YXNkS2JiLzhXMnpUQldiTksrRnd6dkhFbnpBeWRMVkx4VWk0dUlQZkNMMm9h?=
 =?utf-8?B?Tlk2N2pKYkV4TUMvWSt3cWtIVVl4eEdXRFdqUDRVVXB0T3Q0SFhsSFZLdktC?=
 =?utf-8?B?c2JJMktWZ2FHRzBkQXBORng4eW9Xek5OYlgvUHhQK1JaQy9NSXVDRzR4YXJ0?=
 =?utf-8?B?RzZVaXRHUGFYMDR3ejYwKzgwZUY2Y3Jkei92UnBXU0JMbnNSZHBPQ2ZpL04w?=
 =?utf-8?B?MmxKOEdDUHJpU3JuYlFKYXpFT3NwYndzbXNiaWFwSkFqdFdudzcrQkRySjUr?=
 =?utf-8?B?bWJmSWtlUkVqK3dNYWVzVG92K1VXSFpQNmUyUnFXck5pNUsraFRkdUhGWTVO?=
 =?utf-8?B?VUFPVUtocHlYdWFTdWZwdVd1SDhrWnkyYjc2SlBxY1BiMnpEQW1ybFFNaWZt?=
 =?utf-8?B?OGx6YjV1RjZqVG1hSmd0KzRnMXhBQVBvMjJpTDNUS1VETGZRak0rdVNaYi8z?=
 =?utf-8?B?bXVPS3ZITGJIeSt0em5xVUNMQjVweDRER0Q0bkZlMmRjN3huWXM3QXk0SThE?=
 =?utf-8?B?UUtBbnBRTGVPNC9EWGdFSkp2SzdJdXY5M3dnampoL2FQcXJhUkwzUnQzckc3?=
 =?utf-8?B?VEtqU3h4bkpuWWxlK1JjL0dUSFdIUVNoandPa04rVEUrcVpwZWlhRVFVdDF5?=
 =?utf-8?B?Qmd3MGRUN1lta0dvUG9pZkgwSVlXaUE3VFhrd2VsS0lqTW9OZitnY3dISWhW?=
 =?utf-8?B?Vm5scXFwSXFwSm5COVZUUkNZenY1aVQ4VHBSMzA3WEJnbVpmSzgySk4zMEZj?=
 =?utf-8?B?Uk9BbTlyQktGWU5yTEo4cmRPVVgzMmdRL3BjVlVSSXdEUE5SRmtQd1RvUlRn?=
 =?utf-8?B?cVFRSENMVW1TMXFCRkVVY290blRQY1N1M3ZiZXFwdGMwSGtOY0JMN1NvaDBw?=
 =?utf-8?B?c0VRVStHNm14alpHenJZMkZpMEUrb1hmcFIvQmJFb2o1YlVBZm52d0dmaFhP?=
 =?utf-8?B?YTlwNkFMRjN3QXM3SExFV2EyZm5zV3ZlRzlzampSdExxNWY1M1Q0ZjYyT1cx?=
 =?utf-8?B?VklCU1FhT3ptby8zSEN5L2lwZ1dXWHQzSUJwSnJKdXFka0thNXhSQi8zWGEv?=
 =?utf-8?B?Nklhc082RE1XcEhZOXNtWU5WVFRZRG5XQXJqa2dtb1RYMjQ2c0VjaDRLWElx?=
 =?utf-8?B?eFhIbk1NaUlKeDYxTXBlZ29qOHNNc3FEZzdxeWM3a2l6Z3hOc3ZSczE1a0lZ?=
 =?utf-8?B?SEdaSWUzcnhsZkw0N2FFNWZpTTJGS1R5U1ZNMkw4a0lydmFzZDdsRzdpSitI?=
 =?utf-8?B?V2xsK0dlOXZoSU0zZXV0NDhKRFhiT1FuZGVURWltVC8vVnIrMTZPcXkvZXJO?=
 =?utf-8?B?c1VBSEtuc0o5d000U3M5dEZxazkrb0xZM3U4aDF6bUVhOU84ejlhQjh3RzRl?=
 =?utf-8?B?OHRVbzUrdGNPKzJFazVBNWRsb3VKakxNdWQ5VlVFTWNaVERkdWFCbXVmS3dC?=
 =?utf-8?B?WlA2dzdRTEU2Z3NRMUNBUjQ4Z09FZHVWQ0sxaCs0a2dweUxVcGRCeTZKZVhl?=
 =?utf-8?B?ZmhCdmVGSHBiREt4Q1RCLzU5a2FCbStVcFp5cUNvNWc2ODFkUU9vOEUxWGJl?=
 =?utf-8?B?S1JFTk0wMlNxQnR0dVlCb1U1RFY2NEJKK3dzSFI4ZC8xcXBySC9nWTV3RjF5?=
 =?utf-8?Q?C47MF697ja9V/?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3e7a.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a97b6e1e-27d7-47fb-7c93-08df447ca975
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB7491.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:30:32.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_233042_844202_B6A86FA5 
X-CRM114-Status: GOOD (  23.68  )
X-Spam-Score: 0.1 (/)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FORGED_HOTMAIL_RCVD2,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/19/2026 10:43 PM, Andrew Jones wrote:
> The FDT is placed relative to the end of the kernel image file, but a
> kernel's memory footprint includes its BSS, which isn't in the file. When
> the BSS is large enough, e.g. with lockdep enabled, the FDT lands inside
> it and is wiped when the kernel clears BSS, leaving the guest hung with no
> console output. Use the image_size from the Image header, as arm64 does.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty
> ---
>   riscv/include/asm/image.h | 40 +++++++++++++++++++++++++++++++++++++++
>   riscv/kvm.c               | 26 ++++++++++++++++++++++---
>   2 files changed, 63 insertions(+), 3 deletions(-)
>   create mode 100644 riscv/include/asm/image.h
>
> diff --git a/riscv/include/asm/image.h b/riscv/include/asm/image.h
> new file mode 100644
> index 000000000000..0deb74ddd9d4
> --- /dev/null
> +++ b/riscv/include/asm/image.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_IMAGE_H
> +#define __ASM_IMAGE_H
> +
> +#define RISCV_IMAGE_MAGIC	"RISCV\0\0\0"
> +#define RISCV_IMAGE_MAGIC2	"RSC\x05"
> +
> +/*
> + * struct riscv_image_header - riscv kernel image header
> + * See Documentation/arch/riscv/boot-image-header.rst for details
> + *
> + * @code0:		Executable code
> + * @code1:		Executable code
> + * @text_offset:	Image load offset (little endian)
> + * @image_size:		Effective Image size (little endian)
> + * @flags:		kernel flags (little endian)
> + * @version:		version
> + * @res1:		reserved
> + * @res2:		reserved
> + * @magic:		Magic number (RISC-V specific; deprecated)
> + * @magic2:		Magic number 2 (to match the ARM64 'magic' field pos)
> + * @res3:		reserved (will be used for PE COFF offset)
> + */
> +
> +struct riscv_image_header {
> +	u32 code0;
> +	u32 code1;
> +	__le64 text_offset;
> +	__le64 image_size;
> +	__le64 flags;
> +	u32 version;
> +	u32 res1;
> +	u64 res2;
> +	u64 magic;
> +	u32 magic2;
> +	u32 res3;
> +};
> +
> +#endif /* __ASM_IMAGE_H */
> diff --git a/riscv/kvm.c b/riscv/kvm.c
> index 1d494792de79..fc192af34435 100644
> --- a/riscv/kvm.c
> +++ b/riscv/kvm.c
> @@ -4,9 +4,11 @@
>   #include "kvm/virtio-console.h"
>   #include "kvm/fdt.h"
>   
> +#include <linux/byteorder.h>
>   #include <linux/kernel.h>
>   #include <linux/kvm.h>
>   #include <linux/sizes.h>
> +#include <asm/image.h>
>   
>   struct kvm_ext kvm_req_ext[] = {
>   	{ DEFINE_KVM_EXT(KVM_CAP_ONE_REG) },
> @@ -100,6 +102,22 @@ void kvm__arch_init(struct kvm *kvm)
>   	riscv__irqchip_create(kvm);
>   }
>   
> +/*
> + * The kernel's memory footprint, including BSS, is the image_size in the
> + * Image header, which may be larger than the file.
> + */
> +static u64 kvm__arch_get_kernel_size(void *kernel, ssize_t file_size)
> +{
> +	struct riscv_image_header *hdr = kernel;
> +
> +	if ((size_t)file_size < sizeof(*hdr) ||
> +	    (memcmp(&hdr->magic2, RISCV_IMAGE_MAGIC2, sizeof(hdr->magic2)) &&
> +	     memcmp(&hdr->magic, RISCV_IMAGE_MAGIC, sizeof(hdr->magic))))
> +		return file_size;
> +
> +	return max_t(u64, le64_to_cpu(hdr->image_size), file_size);
> +}
> +
>   #define FDT_ALIGN	SZ_4M
>   #define INITRD_ALIGN	8
>   bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
> @@ -108,6 +126,7 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
>   	void *pos, *kernel_end, *limit;
>   	unsigned long guest_addr, kernel_offset;
>   	ssize_t file_size;
> +	u64 kernel_size;
>   
>   	/*
>   	 * Linux requires the initrd and dtb to be mapped inside lowmem,
> @@ -132,9 +151,10 @@ bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
>   
>   		die_perror("kernel read");
>   	}
> -	kernel_end = pos + file_size;
> -	pr_debug("Loaded kernel to 0x%llx (%zd bytes)",
> -		 kvm->arch.kern_guest_start, file_size);
> +	kernel_size = kvm__arch_get_kernel_size(pos, file_size);
> +	kernel_end = pos + kernel_size;
> +	pr_debug("Loaded kernel to 0x%llx (%zd bytes, %llu in memory)",
> +		 kvm->arch.kern_guest_start, file_size, kernel_size);
>   
>   	/* Place FDT just after kernel at FDT_ALIGN address */
>   	pos = kernel_end + FDT_ALIGN;

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
