Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960D4C021B2
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 07:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:Message-ID:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBzJasuocIAQobOaCNMH3kr5j+3D5AtZWRXdn/crXEI=; b=ktfVU8bJCJbQO7
	OWtOoIKwALLRsyVozlhzdGiSKgAH+IRBw4lvwkQ94xCjXScCmt92fL29JytxnADtUIdED9HvZKlo2
	YvZLPRkG7yRLo7L2rL4yal7c66QOwZBmfmU2mgfYCinhne7Jo6veOSuzReW2VpwKaf7LEtnAAogll
	rRgX1PE0286HAvIqoUuwJ2e8z2atfcBhxVWnQZbnL0TCoXfhBPvKkTvWGsj45ArDsGlcMjBLbzGGl
	QGfH+HAv4qEQYblPX3Tm3ByUsMBaYqrEiIrCeIrFOLW0dmwNhigBosDrBbs7OsXTSO6BIz4ebzG3G
	ydEEIBRD5iX/hYMrES5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpeS-0000000GFLy-0aqR;
	Tue, 25 Feb 2025 07:46:48 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpeO-0000000GFIs-3Lpw;
	Tue, 25 Feb 2025 07:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740469605; x=1772005605;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=qtd1ncmm/2IHoCCRQevpTACxc2gRQhLR+4ZapIaXHiY=;
  b=ZrWv8dmhoWFNBKrmRxvh60Nt9a35Ggx1QnHKqnUnRjWtFlU/9ATToib2
   WYqlJ5g7Cii1NDgaOR2JZfvoYl/zq0Ps0HmPrAjpzb3zhx+BHjfuuTa6J
   kDXIMTjwUweQYaNaucDn0dZ/GWqUJa/M1WjI+JeWuvJaFMtKTb7uB089X
   j/uEOkJs4fctGOEIvqAKbgbSH+kTEKyNXzqOM7wZE5eWpojUAQvpjmevd
   0giSlzKIyesPy4vE/ttxRWBPCG4qJXedWBNgDkMdooJbmUlUQSH/J3PxX
   nYOwMjbsHIryixaOnYKEtmzBrq1xtB2lERqpgIwr/reyfE+ta5TXLtdQL
   Q==;
X-CSE-ConnectionGUID: UdKrx/2CQX2djshSEkNSuQ==
X-CSE-MsgGUID: OM1hshIATkmJBA+tR/siDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44917659"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="44917659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:46:44 -0800
X-CSE-ConnectionGUID: Wdup/JZOTy+Ycd+K6DRxiA==
X-CSE-MsgGUID: NqEl6aNUQXqzuJZPzFcfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="116511431"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Feb 2025 23:46:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 23:46:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 23:46:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 23:46:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1B64Y/DCwWNdYP6K1G6pt+SIuMBlpfBvZX/15JpHIOpVo/BRV+poXdp1emuReN+omGJ2oJ/ORs3F3DRCD01r13flygs7gXHAwwMPYbIsEriuKXaoQBCCc02pR3WMXzkjDsYySXs2UPZJAn8xehDcje0XZpETv9xBbWiosjFZuZm4iR4rg61/jAOA0h88/y7ynDerhc9snBq2VSlBb6cNlDYLky41Jc3fuYFGfaf+F3LSSDA6saIfpOT7GaoFIE6wqPWUTAQXGWh3AWpQY5cTOjECwrkCuvFlL1fBY5nbDZA7EpESFK+tNvCud85qEgEgT6TIUBg5UIUbND0fvW5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8uvGHQFwAl42JAZyqWrf42O/vVBR0beGiC+qcirj0U=;
 b=YWifOSH/xIlsnrIytlzGvnjfLDDIcwSnSsCKABNNGgy+x8iHjb5o5n3wDYnb3B4ymQJNS6q0zRH6g6YdpwJ0GwBdYPutGW5sncxKEwQ5pNzsZYXrFi9HPLE9KZYfwUkxAC7pnMDPx544STUwPi6c0IvWgQEfw6qNZ2nK3t9eIIvJLBHEX690HsCdxU5k63lJTuePaTv2dwIQguozNcH32jOIzV+XKxuHIax0agiXl7nSpQgCkkCAgqJsPGZZD8JVUZDfMzHc76oD9Kn+DzT8PpldvX1dldOS7NTfUCvWCTyCcqZDKE+ttk6N1dm4kS8p7RFxAV+vYKRCCz0jPpu4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Tue, 25 Feb 2025 07:46:10 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 07:46:10 +0000
Date: Tue, 25 Feb 2025 15:44:47 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Aaron Lewis <aaronlewis@google.com>, "Jim
 Mattson" <jmattson@google.com>, Rick P Edgecombe
	<rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, Isaku Yamahata
	<isaku.yamahata@intel.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
Message-ID: <Z71072F7FMz5aq/Q@yzhao56-desk.sh.intel.com>
References: <20250224235542.2562848-1-seanjc@google.com>
 <20250224235542.2562848-2-seanjc@google.com>
Content-Disposition: inline
In-Reply-To: <20250224235542.2562848-2-seanjc@google.com>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: b8415bbf-6f03-499f-83b7-08dd5570784c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EDlyXxMtTXMDEtq06WkvAYkLi41NeaUC7Dq4Jb97tepwrcjKgDJut0glpZYx?=
 =?us-ascii?Q?hm65yZLPKT5zaKHfRiztuKnlfCJSGusrpM/5BU496iw1mCIe5+oymadPTj/f?=
 =?us-ascii?Q?nf8u0o5jfVOIReMN45WIYQFp0m7kqhS2YadkKcP77itnjJ6cTc7HAs6AoeRD?=
 =?us-ascii?Q?0c6N/Bq5q3TPObazD/QmgWMLcxplHjIhjbMhgx8KoaFNxNq14j88afC/otfa?=
 =?us-ascii?Q?lUmSUgW7WGYk+tK3LkwHxmUgt9sx6zH+xGXhJF48CrGHk9LKrQjaoir5lYVF?=
 =?us-ascii?Q?mxcrcbomFV87907kFdDf9rjyPz30QLLC2PKKM0NlwWgXXsGgDVyrZaJnxdRW?=
 =?us-ascii?Q?r/lewqVo/XdYdTIvEE1Ejy8he5gozanCAYFb+L2x9laPJolcZPUQB0uazY/W?=
 =?us-ascii?Q?jlXcGlnAD4Zc7njIssCSJYGxgDtM2MrtAM49T10r51wBDTTG8Pq0j3kCuyzs?=
 =?us-ascii?Q?cu/VrR5WarhAAzP3fap0vTusa39W4ZptGmPEXbVpxQkIPk4UF3p9e58wYd6U?=
 =?us-ascii?Q?dr5Se/i2PZxuR+4p/15mmNiv74KO6DPKwGEUXnM/y0S5PbY8mpWMeVi3aXnK?=
 =?us-ascii?Q?+ZFeEOvPxQnZu2ZCkxB9zDety9L53YTTyazRrz2jqAtiA3hN6czBYFMmhTZ6?=
 =?us-ascii?Q?0WpBa0fB8K/WvZ0hi8G6j7Z9oOLQ7hOW4dgAkroCUlYyz3xsJJnv6p8TQOHs?=
 =?us-ascii?Q?Puq7CURJVklhO/dnUlRyvBfMixSWXo526YTvfzVO+U3Db9V5tZj4QUpZpU/t?=
 =?us-ascii?Q?ezEb56P5cYjJnLZKU7/Twpazpp/yxoJQYOpOct87TpfZWDA/yjYuBCDjf692?=
 =?us-ascii?Q?BojK9UqNtMuqYbEC1QEJnx8+SEybWhZVZZL5VNt47goPvxn4t3ADVxQ0X1K3?=
 =?us-ascii?Q?PaMhtYfYIAOF4guwSeWD8OJF9ciNWldg7NhLzYXWuP8p608s4y6XSQ0uASCn?=
 =?us-ascii?Q?vfxWXCL4bYt9PadmTO3IVSyEdPItG202ujEGv2uhXxW2YpTKHPXsI8cxnUq5?=
 =?us-ascii?Q?K9oLYUHFQc0VXuqLmaBKw91ub06bfPC5SehRTEmWvFurgfYaXYZiT1sgUSeq?=
 =?us-ascii?Q?qmUnCqkiP94sZCQvY3mg4c6lbJl3qBaRqf8033tLTkN19ykUVmC2IRo18Qp0?=
 =?us-ascii?Q?Ov/ymgAkPbnGtBGnRIQe3PBfD14U/Pq2oys/RHk7SO4SAUS01hd8CnUEJU9o?=
 =?us-ascii?Q?os5AtLyttwyV+hgBaeMjOSDgS2h4nBW0/hqHivIleY+mHhK+SCMFxO/PiytQ?=
 =?us-ascii?Q?jEBpF5Pi9REdQCc0LBVLSuzL0PvQEL/AtwaJS/aT6dt1Xihe6IdPhoymt9pk?=
 =?us-ascii?Q?vkA4D0z/rqZlV7XsH/kZH+njRAoEguBS7RQp9VCbeKI1li0/eGzWYp7jo5BP?=
 =?us-ascii?Q?uQRRdtYE3iDkOnT1nXdFkY10y2Z7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7E+/0OwAVMT3UBahbTd+fW91YMCe5j4Ip2xmTDfG4NFamNc6YDqaDi4Bab5u?=
 =?us-ascii?Q?CGLC3aVn1RBYwBE0Yf4j1c5PdDpB1bpESkvC5qMvfueHdMPdyxxXr+wlvuzQ?=
 =?us-ascii?Q?LoijffkDU+BMk48JQ13hPEy+ixRYA0h+PFxF5Q0XsJJYXwsYIklw9KYIvBbZ?=
 =?us-ascii?Q?wHPGJiAhZS0PLDQ46yZrnGQJsWz34cvz8Bp/uyQvIEOo8CCOM89PkCJgBOau?=
 =?us-ascii?Q?fIzRu/SoHBXw7kNRrwYnZUWSrSegyqTKx/YgAehGUrwSnyAiAptp2TY76+t3?=
 =?us-ascii?Q?xhnGCvIMFsXXmoVHqThl7Sd6wpWdzr7hPxMPj96FgjrLTILZ0hhLjqGtFvS2?=
 =?us-ascii?Q?NasPijVcuptqTbRzHiW68aIattDxKXBm3CXuQGkYpOE3wRmDZqZHfjdsGl4i?=
 =?us-ascii?Q?lMI4uMeDMVVq7SridReyrNg0OxfmoGCZ7J6Oc+Bm6TZDaTL7+26mcBboQgTo?=
 =?us-ascii?Q?s28o4ygEwxLXig1/1G2UFsZl2a5nGAVUaw/Kcghm6sVp3bLcP88701Nj/Ksy?=
 =?us-ascii?Q?Uk0lcaNdeHJfp9F38XC1l1mFWOFrvMg7b8s4PJnGvp1eAdTIY8uRza9wpsK4?=
 =?us-ascii?Q?bHhBs8eQY/vedgT/Hq6h+GM1BkxnBINn+j5XbwCHAEdUx8YFEh9L785GEmlw?=
 =?us-ascii?Q?KU8OENLYIIJXhwOQUmAVnoJ29+IvGUEo2VdZqlSoHUYc/chBYzcexbUpZW0E?=
 =?us-ascii?Q?szmu9rATaS2STcRLBwhFyynpNxWM5SrxUahhU5bFz1bu5NYuxc4r5/TCAEsA?=
 =?us-ascii?Q?oLM5CH4+0mmE72HrEfLUIoG1+xnJoVHsiFAA5bmUauODO1QxoBJGIoKdt6gD?=
 =?us-ascii?Q?u9XWGzNedJtW6WuqspbQ4ovZwYsbkZcs1pDmVDNDE3nOkj9dHss6/5TQZ9Oq?=
 =?us-ascii?Q?Il3EZ7yyJQm9/RJOOiUSew+BnQyQbSGTZkCp9/O1J65M0dXCnIJPumpPChWH?=
 =?us-ascii?Q?+AY/BA3KOCsILEq8C4mkwKJ8AMpyQtstH2hyL9uInL5L+mIvAR7XeSP9yIZz?=
 =?us-ascii?Q?Scbz5N6oAMOwkFa2BI2nTajHg3V8cCoGenLf2S46u1RuEil8SUTryi2jporg?=
 =?us-ascii?Q?r/ti4N0LehYJtjCHIF39CAEcUCiCkhE1kj1wA030jadjnxdPDGlCfU8OErPW?=
 =?us-ascii?Q?NMqpj5KYZ+mmUnraiFhC9PhZiVFFQJkalh4Zjo3akpLlKpme2q/mo23fWVqo?=
 =?us-ascii?Q?hsTn8fMgHMO/UWgr+ZFNUc1EM86BJK6zNrhzi3EcLU3hSBIL6pkxMwl/OOdy?=
 =?us-ascii?Q?kVL+BUIQqM8zrQi6HhwsysyIffa9Kfje4EmXD2HBSi/kK6rup6EeDpEPtJ/0?=
 =?us-ascii?Q?7ndrq7gYl/Q1GFyVGLlwh9p7IpsFFBoKQnJLdlKGoS5PEJqXSpkY1KqOsUlM?=
 =?us-ascii?Q?fyjf0sCzpRRClLBfZnjmWvxfhyGux27mTTYYMn+/qIZYK33tdA/fvKDSpEwv?=
 =?us-ascii?Q?rp0KnoZhPQR51l6qyfzlPZjgVFJGOt8sDFcZyRUJKHKMfCj1YW4q718NvGqZ?=
 =?us-ascii?Q?z9ZaR+QcMUZxOo2qWKepUNe0ppI7jqXI9RsQZ5xJ1o+K+K/Zt0yLAWdaZX7G?=
 =?us-ascii?Q?O3LVYHAsOSNiPf18tBpY/aSZyiARyRkRTz5WN7lL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8415bbf-6f03-499f-83b7-08dd5570784c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 07:46:10.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7p9gnG7kZP9nJdTOXRbKoOVtjvfPTKRN9iiDqhZhCZuureI6PteGs8EPiaReF/1U4jneVUqAZGKThW/AggR+5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_234644_878496_976644F9 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 58b82d6fd77c..045c61cc7e54 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>  		mutex_unlock(&kvm->slots_lock);
>  	}
>  	kvm_unload_vcpu_mmus(kvm);
> +	kvm_destroy_vcpus(kvm);
>  	kvm_x86_call(vm_destroy)(kvm);
>  	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
>  	kvm_pic_destroy(kvm);
>  	kvm_ioapic_destroy(kvm);
> -	kvm_destroy_vcpus(kvm);
>  	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
>  	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
>  	kvm_mmu_uninit_vm(kvm);
After this change, now the sequence is that

1. kvm_arch_pre_destroy_vm()
2. kvm_arch_destroy_vm()
   2.1 kvm_destroy_vcpus()
   2.2 .vm_destroy hook
   2.3 kvm_mmu_uninit_vm() --> mirror root ref is 1 upon here. Zap the mirror
                               root and reclaim SETP page table pages.
   2.4 .vm_free hook

Since TDX needs to reclaim the TDR page after reclaiming all other pages, we
currently added a vm_free hook at 2.4, after 2.3.

Could we move kvm_mmu_uninit_vm() before the .vm_destroy hook and after
kvm_destroy_vcpus()?

Or move the .vm_destroy hook after kvm_mmu_uninit_vm(), e.g. after
kvm_page_track_cleanup()?

Otherwise, TDX still needs to introduce the .vm_free hook, which is invoked at
the end of kvm_arch_destroy_vm().



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
