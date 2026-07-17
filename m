Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409E4C44515
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:CC:To:From:Subject:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EQ4seH4t7Rsgoo2HqoQdQwMznLkixWwxSZeK1CqsOY=; b=4f2P7IPuzP3TEr
	0lLj+4tMgAO84BA/CkwcjuMC6MfROtV1riHpGcH2uy1OXX6euNVMItuyvCOazkokwT380lGCaI8vE
	o5N5TUYHvugpqRVKGSD92wmcfvUsyTMF1/bdYRH3wMqsIQ1WhhJ3PviBPL/DCGEQJac38aeId+wBP
	aDiVoTW3QBpDBMzc0JAslJQDGzfSwjU6kO8v7NL1OiKRbxStpUJk6fsQygugDswM43Gj4NhYuMLXk
	F4Ih1NZx6cdV7/keNt7wvTy4nPxw8t2zoVUROl40+If7hMqteB8AcDIcut1IUo8KeBpuOoWoY7KJD
	6z6o6Z/VxViqBcc1FJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmRF-00000002tVs-3AVP;
	Fri, 17 Jul 2026 17:33:29 +0000
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.72.182.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmRC-00000002tV9-27SG
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 17:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.es; i=@amazon.es; q=dns/txt; s=amazoncorp2;
  t=1784309606; x=1815845606;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=PIGcfLYUl7LIEC94VnO4vxW+7a3j6Sl1eSZbi8POaRM=;
  b=Ql6cmN7xxVvmcuzlhX49FKqnichiC5bu0zkM7KiE80cB8KpYS3bm9fPx
   kG3jGqBSG+cvAEF1Hk4r3/yfrK7LjGld2WenuEYPMup3BVfbkbUvyCOdj
   s/j/B3shmA3nK9WsmiuY5KKYn2aXU/IV2xazwuO6BFu8XkPHbfYTrjkf0
   PUeoZkn6WyhO4cpg82Bx+jCTNEIqlB0xsi6vVuWcmUhQlbb3ZVkLTjBaN
   AMnFvzzmklHsdVg4OTQwdTLtfrInE6vJ32liYLNOQ/WPkk0sdxjtQru4y
   nEKuoJpHGaX5sD1vYeYt0pgUtQJsQoVGikQRytZp8e8jkAP3h/HNJj1oS
   g==;
X-CSE-ConnectionGUID: oX30EYh2TQSYtUHTff7C2A==
X-CSE-MsgGUID: GhR/rKoWSTO6OlRL5UY/hA==
X-IronPort-AV: E=Sophos;i="6.25,169,1779148800"; 
   d="scan'208";a="16606300"
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Thread-Topic: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 17:33:21 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:15026]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.14.105:2525] with esmtp (Farcaster)
 id 1888babb-3276-4d9f-a1cb-f2ab67553105; Fri, 17 Jul 2026 17:33:21 +0000 (UTC)
X-Farcaster-Flow-ID: 1888babb-3276-4d9f-a1cb-f2ab67553105
Received: from EX19EXOEUB002.ant.amazon.com (10.252.51.83) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 17:33:21 +0000
Received: from EX19EXOEUB002.ant.amazon.com (10.252.51.83) by
 EX19EXOEUB002.ant.amazon.com (10.252.51.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Fri, 17 Jul 2026 17:33:20 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (10.252.50.44) by
 EX19EXOEUB002.ant.amazon.com (10.252.51.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43
 via Frontend Transport; Fri, 17 Jul 2026 17:33:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7UFo/ezpRcRLraXjJznb08tjcMYZ+S+KrmrE9GGaM+1zLaP2cU1X5phLbeJ3sib53xgcBjoeheZYzPlPlaP4NhgDQYDtswFKtTV56qWaCoXJWi0Gd/y/aCbpNFCINl5jRSyV9RM5jMRkHPS7r0fem7A19v78xFBBJxJDf1CV1HeOMux3QwOqZ3NJAajuMwhiecVz8WgFIYlXZtj9ml00QCO6eSMvuiVBUON9/25oiO2v4ECObKMR9G4zVGkY4SZNdDTYkLvzrPaklHNn/OUasuzSZtNEkXXCJ19mw6LlKktO7J6IjrgKOfQ31DVqEnOs+tkXMwO96blKHiFzCWlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIGcfLYUl7LIEC94VnO4vxW+7a3j6Sl1eSZbi8POaRM=;
 b=oIJ+sbvVRezcD71s5LLR+IekAvIqWaM7wMWNoMdnmpCXXytoDdBH0ETsx6fB/xA1EnwuPUOzcb6aImU6pXJ7MWQbM0vzhpHIL3sRjlUur/pcjeyZX3HOL63PybvbomlAJFGLd/IgLfR8AdYqxauOSMIHbM1WFw32jOFIMF5LWl5lFHkI+xQyQACCTXpDmGxq8B66bFIJM9OietE13D6AgDdyx/z8sKxAn32HdTTqN9R9nQFGccd1uCkRmZrQyvAayM4SYlrRW7mgixFgE3+z00SAjnIQyPqVVmvBwgvuOhS0cgo8+gLBNssJJXwZ6OqRESKMuttWdFFsQdYAgA6ctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.es; dmarc=pass action=none header.from=amazon.es;
 dkim=pass header.d=amazon.es; arc=none
Received: from AM0PR06MB10511.eurprd06.prod.outlook.com (2603:10a6:20b:700::7)
 by AM8PR06MB6898.eurprd06.prod.outlook.com (2603:10a6:20b:1da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 17:33:18 +0000
Received: from AM0PR06MB10511.eurprd06.prod.outlook.com
 ([fe80::9834:3241:1f23:20ed]) by AM0PR06MB10511.eurprd06.prod.outlook.com
 ([fe80::9834:3241:1f23:20ed%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 17:33:18 +0000
From: "Saenz Julienne, Nicolas" <nsaenz@amazon.es>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Saenz Julienne,
 Nicolas" <nsaenz@amazon.es>, =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	Paolo Bonzini <pbonzini@redhat.com>
CC: Sean Christopherson <seanjc@google.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, "ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"michael.roth@amd.com" <michael.roth@amd.com>, "Orazgaliyeva, Anel"
	<anelkz@amazon.de>, Melody Wang <huibo.wang@amd.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
	"coconut-svsm@lists.linux.dev" <coconut-svsm@lists.linux.dev>,
	"joerg.roedel@amd.com" <joerg.roedel@amd.com>
Thread-Index: AQHc91VNfGXASvbj1EW/r45M3lCQtLY03m8AgAAR8gCAAAHXgIABOIgAgDvMboCAACO/gIAAGxyA
Date: Fri, 17 Jul 2026 17:33:18 +0000
Message-ID: <DK10YP78VVQO.7BFETGMA9P4F@amazon.com>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
 <aib8n5lO6HKbLC4Y@8bytes.org>
 <CABgObfbUsDeStnZF-7oyR-W-Bvd4qTMoeUwGizgn10UTdKtZ2A@mail.gmail.com>
 <aigE2EvJyZlYDz0V@8bytes.org> <DK0W6G329B6W.2KGT7FAVSKNYS@amazon.com>
 <976f1a8316438d5b7c2f446a0369dcda3289cc92.camel@HansenPartnership.com>
In-Reply-To: <976f1a8316438d5b7c2f446a0369dcda3289cc92.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.es;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR06MB10511:EE_|AM8PR06MB6898:EE_
x-ms-office365-filtering-correlation-id: 7e5155ec-64ac-4a11-2854-08dee4297db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|18002099003|3023799007|22082099003|4143699003|38070700021|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: lK11OHJRm6MOr99AdZhGX9H1mGplHi9pMjbSJ8AoAAHgqs5CgdP5u1G3qafou/6Md8qUfLUXhEwPGzwNN/YDdICn5ko1nvAtxd9ZL0vltXPhUf08VLOJFifI7/UQUfx6lvg6n12lF1v7DMslTlSTR2K+nLMCzeFG9Vu6bgsOhNMq0m+eHkmpP7+ZzXyJ11YH3sH2yN4u5KPK1Wm3juqO73Jm/ZXyftccQBDhB6juXhfJc+4kleyHlu15PN1Ah04bEfwznN29nnfTjm7mPG2i/utro7JSN4/XbssB6o3Ne31Kh5UnN3fDbMhcwGjod0c9TLdRpKbEb5yQMKOmrpBJfZBkxjkgcTIUlN7Z2MDHrqSORTlXBkW/iDAk+F0QsKurW2b6scQXoddsC+okWCB+2c5Ls9hTzXe0ki49mygft3r1setLo0l7Sps01EYNxhCwIypPOp0x0QGRntcu/ItdQchrWC1SwI75D5agiqsHW4WM6bTG7Z0x+uOQR1ogfFvIX3CVfb59KNv+fssNve6ItjkxJGIoNrPS1hd5FCXaGJi5wHab9hrtPA+tNjq5TQXDcj2jOKz9RByLHUclJehqdIK221vq31rGeWRYwTZ6tyjkgLLT4SmnzuCSyFf6avs0v1SO2IR6tOqD6ZH9piDnDu2UNRaN6mCxbKRGEMgEKYTmvob+wwU2aSenXiCBmtN+W1ZbDfgyvn+mwTLhx36sbIIpbZU1fdk+LKIQlayl8TA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB10511.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(18002099003)(3023799007)(22082099003)(4143699003)(38070700021)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MThPcW5KRTJ4NjlXZ083Vkw1Wm16S3VPNTEySkk5WCtaMm9qSkMxaXcycGNM?=
 =?utf-8?B?OGhEZldKSmdjZFN1THY4KzA0TE1OeWhhMWxpc1VKckpqN3c5MzdNYS90eFc4?=
 =?utf-8?B?bXdxYWtrYllVUXgvamJUNEhYajR4THlJWUdzcTQrL1Z0WFFOMmpGUU5lOUNN?=
 =?utf-8?B?bFd0MHV0endaSTVmSFRmNlNlNXJ5UllzY3J1Y2FQS05UNms2TVRvWFowOUY5?=
 =?utf-8?B?Q1JlNnR6eGJmU1lIZmRubHA3aStNakplblh6aHVBOGp5MGpIdEtKeFlBR1Vv?=
 =?utf-8?B?U1BEdnVCZEZmQmZqRlRTR1ptT3JPQWp5WTRGZVIzOUZsbEswN3NDSGdTMDV2?=
 =?utf-8?B?RTRkZ2JqVUtuVWw0bHlWNmZRY2w1a1JVaEtZMzAzcFN3M04wRlhabmdkSVFQ?=
 =?utf-8?B?VnE2RGw4OGR0VEtZSEp5aU4zNUY3NElVVE1TVmlPY0FDMzd3UXNKbW91Y2Ni?=
 =?utf-8?B?Y0U5N1ptR21YcDA5L2todUNKVVBzMHBQRGNPUzNPdXJhRUpKOXFUZXlRR29q?=
 =?utf-8?B?aGlRUy92cHZuNXZtM1F1ZlRwR3B3L2RKWEZIZHhrZlorMXBMa2krK1QzNGg4?=
 =?utf-8?B?WmtwNGk3Ti9HaG8xYk1oVGNKOHdHcC9KTW1uZWc1djBselgrdytOVGhLRmFO?=
 =?utf-8?B?UVZoSVYzTEQ1K0MzVHpteWlSUWdtK3psVjRqZ1pVb1VqWlp4a092aUJTS0di?=
 =?utf-8?B?OXpqSHpUMFpQSlptMGJHcWw3eWxFVUZldlBxdzBVOVcrVWlxUi9aQWRwVk9W?=
 =?utf-8?B?Q3BHeHFUR2U1bW5WM1kxMldNcVltaHZsUUNYb3RGcUtGT0FGWUhZSzU4T0Fr?=
 =?utf-8?B?NUFDU20rSXZzR0UwN3k2OVNVRlM0TXNBbHNkZVBxakhRd0MySHRxd1J2WHFE?=
 =?utf-8?B?L29scFZ4YTBSM0lqM1FEMFAyR2p5WXhHcm5PQXlWRzd5TEU1VEl6YVVOWGc2?=
 =?utf-8?B?d1dTOGVQRmNPMHExcElaVVp3TkNWVlpjbi9tNmJOc0FzMWFHWnVlV2gwb2Rq?=
 =?utf-8?B?QzgyUndvdDBFKy84VDNPSDlWZ2JQK1BFN1k2SE8xSk8rWFlGT1Jqc05DNzVs?=
 =?utf-8?B?dVo0azdudkRrN3NhTDZiMkRiazJaU0tUb1ZWNklBdkdORzNMQmxDdnkwbjRK?=
 =?utf-8?B?OGtsUzloMjVub1RrTWRpUzFlQmlZeFY5K2dZcjgrdUV2RjFrVW1oSGlSRFdL?=
 =?utf-8?B?NGExVkpjWmQ4V2QveGN1emFTREhKU2ttRDRlMWxnVlNoOTZlU1VOMlA5V0FH?=
 =?utf-8?B?ZFNraVMyeEU3d1VXWk44SmczSEpxa3JhSjlubXRhUFdqRTRhdi9NallycGF0?=
 =?utf-8?B?cWVrNVo2d0VJSEdnN3pDaDVQNm9xZkFZTGVCLzF1ZFp1WGJ5QzliU2ZtbVpi?=
 =?utf-8?B?c2ZzaFBFNVNYclVHSW9IK2VhR0hLdjJKNjBxMnl5M0lBbHZ1S2JhS3kvdlZw?=
 =?utf-8?B?UGtLMGswdHFqY004aGRjM0tqdityZ2RDbS9kU2RydFdwdnVVMlZ5TzdEZ2Z2?=
 =?utf-8?B?eWE2Y1ZDaHdvVmVmTjU0d2hnZ3F6bElqYTJnS01oRCtrR0hITXVRR0l5Y3lt?=
 =?utf-8?B?T1VDTDFDM00vUWVQR0pGOVBSeSs4RUIwQ1FHWXltYWRQdm1hUkkzTUZ0eGM0?=
 =?utf-8?B?SCtWNTlRbzR5ajlpZWJWSGV4MXIrbU11SWR5QkFDajc4d2V6SmI2a1h1aVRh?=
 =?utf-8?B?VkdEckRVVFpQNEF3dDhzYVNndkgyT05YUSt5eVgrZVM0QlovTFdtcWUxcDFa?=
 =?utf-8?B?QXZWRFJ5YW55a1I3Z3hCOUR1R3hVS29iNENNdFJvRWs4SkNqNHIybFpxNENn?=
 =?utf-8?B?V3YwOUQrRVFreWpEaXFsT3AzNHJqRzZDbmZZYzNIQVJwVjNEbkJYS21vUzJQ?=
 =?utf-8?B?ajZrZlRVY2prQkN2eHRERUVmSGxLdEdjdi9ZQzNSSE92MFQzN0dIZC9PNTFV?=
 =?utf-8?B?MWVROTI3eStWRjJtQWwyVURXNFprZ1FBVlhML2NuRHcrN2VQR1JSeEhCWmJh?=
 =?utf-8?B?YWphcFlucjZRNUR5U2J4OFplenlXSWkrTUxlUFgzQ0Ixa3hna2VWWDZPcUFJ?=
 =?utf-8?B?Uy9zUWc4Rkh1ejVHTEdDU2Z1RVZwRFZESlVYWlIyV1VuMFhaakRnK3FOWEk5?=
 =?utf-8?B?UktBNXJOb2Y0bldpUmVHM2Nkcm5PTE9VZ1JieXVpR0p6R3d6NTVXZGVXdzlB?=
 =?utf-8?B?RjJ2VjVoZmFmeHREcGI3THc4ZkdDOTZqWkk3SW9hbnplSDZVU2N2ak9XcUxB?=
 =?utf-8?B?SDRmbTRucDRyUjFTNk93SkdTOVJ6b2NFNlhINm8vSkdHOW1GNVFPeTI4alJF?=
 =?utf-8?B?Uis3eU1pQWR4clZ1VEZyVmVHMUFncUVLMW1LWG11L3lnclAxTm03Zz09?=
Content-ID: <407FC8A1B2E92440A51D211D34701BA5@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TPt5/TJofoiIgPbh0xsc8jjXt6sZaU0Cg9q19UUkiWkx6J+mPYtIWk6+6XHQGi+q6OQXQ2rRRouGaXrOcs173jQcCi8CG6BjsTzigcecxIm4JQDN87wq2m28mRGi2jNqvZpqXohfmS8cFOXltLoDb0bxN1cmmXA28UFVFLn7X/Qi06yhPeMTzaTIMRG/9ZYBrbiRYpn3a4jyV50o7U3DTscOFA4rIeJITwe4AZxf/8YR4yKlqlTqE8bJbAqF7SByuPPVjQenSj+Khzsxm2nkoscY90IYNnfnd102EzJA1rxa2z3PXHC5RZx7pceZ+g5yl27RyHjfcvlRUQRAyhxo2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB10511.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5155ec-64ac-4a11-2854-08dee4297db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 17:33:18.7235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ing1bDfQdb43ZDSmLfhp41cwsMm/FZTaP7IPlUTBhyUUR8jg6R08F9Q1lQdvbylAwccTNWu3Kwi5QTdpwmITgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6898
X-OriginatorOrg: amazon.es
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_103327_174881_7FCF2FE8 
X-CRM114-Status: GOOD (  26.17  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri Jul 17, 2026 at 5:56 PM CEST, James Bottomley wrote:
>> > > The idea of the userspace scheduling was that you're not forced
>> > > to use it - the kernel can always choose to override it if it's
>> > > using an accelerated implementation of planes (and of plane
>> > > switching). But it also leaves some leeway to different
>> > > accelerated implementations, each of which can pick their own
>> > > algorithm.
>> > >
>> > > Conceptually I'd rather keep the possibility of userspace
>> > > scheduling. But maybe it doesn't add much.
>> >
>> > My preference is to keep plane scheduling at one place (in the
>> > kernel) to keep it simple. But if you see a need for user-mode to
>> > interact there as well (only really works for VSM), then I can add
>> > it.
>>
>> The responsibility split we had in mind when we built a VSM emulation
>> prototype [1] was to keep all VTL policing in user-space. This
>> includes VTL switching, Cross VTL IPIs, Intercepts (Memory, MSRs,
>> Insns, CPU regs), VTL aware SMP bring-up, etc. Even with KVM Planes
>> in place, my thinking was to keep it as such. While all this could be
>> implemented in the kernel, in practical terms, I think it'll be
>> easier to get VSM support upstream the more we move the
>> implementation into user-space.
>
> I looked at the kernel bit.  The vsm/dev branch contains 72 patches
> over 6.12 which is quite a lot ...

Yes, and on top punting most of VSM's implementation into user-space,
it's incomplete.

> However, from a quick skim, the main thing is that you used multiple
> KVM structures to manage the planes which means each plane naturally
> gets its own address space.  In the current planes model so far there's
> only one address space (or two if you have SMM).  SNP doesn't need
> anything above this because the VMPL protection is naturally managed
> inside the guest (so not really visible to the host) but a VTL
> implementation will.  So I think the big question becomes how are we
> going to achieve address space separation for planes?  It's tempting to
> say simply one address space per plane and make SMM its own plane with
> different switching but it's an awful lot of overhead especially as
> most VMs won't even use planes, so it looks like there has to be a more
> opportunistic model for planes address spaces.

While adress spaces are per VM, KVM memory attributes are per plane. It
should be enough to implement VSM's memory protections as well as the
enclaves design you mentioned. We have a series in-flux implementing RWX
memory attributes [1].

The only thing that's not feasible "naturally" with attributes are
memory overlays or any situation where we'd need to change the backing
memory of a guest physical address range just for a single plane. From a
VSM perspective it's fine. The only use-case from a VSM perspective are
memory overlays (and those, from my experience, are useless). I don't
know that's a deal-breaker the mutually distrusting model.

Nicolas

[1] https://lore.kernel.org/kvm/20260716181456.402786-1-pbonzini@redhat.com/
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
