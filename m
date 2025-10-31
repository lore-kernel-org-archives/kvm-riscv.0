Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2EDCCF9FF
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	References:Message-ID:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFX5M0pb4vZqqMraEO1evBhYBBSvYPTGveQ8QJfVz0I=; b=GBz94LzjtDjDyw
	CZbSaXWtnA2Wgt9+iAyiclGik0ozmDCEd14NhaNfcBt/LwSPecFaVq2hSMyYHqW36JsMA0nf9Lmcm
	wEJ6F4uHU+UPChkdHu2e+OogEisyn5riJ6Woa1IdSoLBfJwj7puqoBQPPwZbfh2tkTlYwLG9v4XmV
	Z2Ro7ooWLEsjxJjk0YuDFJ7O9HhNPr4EODLFzxrKciAFX1ZftMUv0fyCSz2f5l/PnvLWrvw2twAmo
	xlfXj9+OXJ88O8lmebA1N1m2cHk5eLqSZckSjAWGlIDCpdFuKWFcKrn3mOztENHnpumKJbO0VdZlo
	ZPpqWpuGCkPzVOqb44Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkUr-00000005eJy-3E4z;
	Fri, 31 Oct 2025 08:28:33 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkUm-00000005eIb-0MT3;
	Fri, 31 Oct 2025 08:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761899309; x=1793435309;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=wrTvE02KVhRkFZHI4kWxXty2XqCcQnro9W6pPTtcJic=;
  b=G/RqD/jaDXxSUtVizrslaMO6fEF/FgMvwv5AAxVmhkcxgA5lnkEpqwze
   6szVjX5t5lif4v1FbqIP92tlNTTzzPxnDW1htowmYSEJ0DTRLIUggpn1k
   FH5UDIUUhab+DcAoGZzxE1s8Ue5WKdSptwVC9LWATvnxZopIWDNs3Zd51
   Z999w2eUit9lb+jZfI86d7add89A5D7QB3Zm/Pv/amOOe/2y7dxHXouu/
   lCqVqDxaoqmakyYmWSfw012nLgFp/h7oeuM2nXkQ7cbxjjXQWlOppkDIv
   e+um8JO9zb6mKtPniMrTONx9sko3FQsH4snb3hXWHEAsy/YSMaJLGpCn4
   g==;
X-CSE-ConnectionGUID: dBddRWWxQk6VdOYyw8QqOg==
X-CSE-MsgGUID: TxdSLnKlRSKZ/sh6Xnxn3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64203662"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="64203662"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:28:28 -0700
X-CSE-ConnectionGUID: V706WCv8SJKEhjPy7crbog==
X-CSE-MsgGUID: vj+7hwDeTrOKmB9Rt6NzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190525913"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:28:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:28:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 01:28:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 01:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/1mKfd/q5MdSHapznqThOG8CIAMHLm7v0SoRmg/c0DeaaZVw9ZC7okRgCYlrr3WeLzVZScvGMjbF2tG0Fe8PaDcAawItQJkUY6J/CoS2JYQzS4sS9U8bV1h5zo7rhPpPE7k/6X+gxSvN2W8ncZ+MWPCNjUEpX/+qSDK1iCw2mzQdwD0QWPRncpaP6SG0AYe4Wi7rkbwzUfuFD+iP4kPoRAR9GjzV+g1BWGn5G2ITWZH6MGeRM+2iLPGQt3pQUNCF31Wo8UmAH7FLyAqIr3vWU2FYg5sDZAUD5b8zkPe5d9OdT3SVpC2I/PPjhqpFv8xIJFhlo3eB+OwT0U79vl2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGtyYigZDkABpi97+oP+IHR7pUTCRMifrbrAXJoA4Rs=;
 b=wDEBWxijXg0ME66Rqj1USWYF/8kmZYa9qoRlvVKuacuoCvdwCpZM/dOBln1QBZhAhxrl7AQlcy6Gs9fZOZ+9uDjCDza8kZhgNqzwJxjagRwjUJQg1pv/BcXUEwJkyQvj/8772YnPgIxS3JuwD5uoS5kz7g7EXU9mA01S1LJhgLImZ1VZH8k0t7dYLzMH3x2MCUOOa+fPujY/9UgfM30VpIRjnEqPX51iECUyKR6wtYhYe1/pDR6fPsknroGaMTfFqDvd7A7sUOb8ee+0zkou2hOLVocpimyONqjkg0OVfX2RAu4RGcKQNI78hZg++ynnNTXPReQhKpWTkCLctudQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 08:28:23 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 08:28:22 +0000
Date: Fri, 31 Oct 2025 16:26:50 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth
	<michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>, Ackerley Tng
	<ackerleytng@google.com>
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
Message-ID: <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-27-seanjc@google.com>
Content-Disposition: inline
In-Reply-To: <20251030200951.3402865-27-seanjc@google.com>
X-ClientProxiedBy: SG2PR02CA0098.apcprd02.prod.outlook.com
 (2603:1096:4:92::14) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 51174476-778e-4900-0491-08de1857742e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ayDxdrcPenABoCNMzDNA8pITDpfhUBQ7+BBv2UDp1TOUEzZjEyPFEeM2Y3K?=
 =?us-ascii?Q?0OXXQTDtdTtjfylYLNw3NvlgYecKVEJ/J13AuTw+BkaDw2R3yiIagNGwtTeX?=
 =?us-ascii?Q?LvsORteInwyU3Ql6sAvtuPoZBkv+Wh3ggZz8SY2gb97vW26GNiTmyLLow6W8?=
 =?us-ascii?Q?brUb7ktYOk7rcC+vjmy8ThAfE2ZUHH+qYaXxr4mgvSgjLxrwJtSCUddcDclK?=
 =?us-ascii?Q?5FcvIa9b31v8EN0v7nvaE46nW+7+HkyRHa2vWtZIFO0G1JIXuMDHkv/8ON2y?=
 =?us-ascii?Q?EIhxwKLN+kWUAIJ+3D3KFIWPsCr5/cv0MD9bVQK4nXo0ycrrgC/fpMwGV9WY?=
 =?us-ascii?Q?Xc5V452vYoKCVSPRBeip2Ml4Bt36E46n6s1/DT2NIpQkjs19VwhL1iWL5Txx?=
 =?us-ascii?Q?xizYjNdGHY0v3cZ+Fg/SqqP/bfjtqhMIosmnoJXY8W263qR30JmjHmUDoyei?=
 =?us-ascii?Q?CuFu7imuc0GxPJ7lsgYdyX7RQB8O2n/keimkI2cZdjrnHz21Yr8s/hKGRtm6?=
 =?us-ascii?Q?pEukXiune/QXMGe3CtrvhNmgpihRaGmR7YK3F5wsr7mUfHdep9Dp57LuZCzs?=
 =?us-ascii?Q?AmhAkJEuSWAYswBDB85+UDIVfynLNKyHvMbWGU3neBXdii0sokTdUzujSvzY?=
 =?us-ascii?Q?91rHZK3/0fwvbN/uBp47ssAvX5alm6vCOZYgrBDR4jamt2EXh+dFy3lvN+YY?=
 =?us-ascii?Q?7WleAzMcvpzzqbmicAO5qPGzIrs6ajS7vBXDjBzck2slQHgQsnNCT2Cpby0J?=
 =?us-ascii?Q?iarRf+Wo7DdANRxtb50R2U2XgzZ/Fwyde+8C6rX5cUmEnbura52diSgh3Wc+?=
 =?us-ascii?Q?EN4CNkfijfEt1XV8z5BFG+1V08jFz12CE/ZwDhIyJAP08g2Dd0jlPtAR3Ocu?=
 =?us-ascii?Q?ArvmXhwFNQYnxzt39H2eJYN1+ZJnlqYrPikmBUxNb1EWOhQkyb/9FVSNiq3Z?=
 =?us-ascii?Q?YN43TlBhxB3zBcIGGcGvbqsOIV9maaHYy/nP6hfBYprr7m/dMC88m16AzZPE?=
 =?us-ascii?Q?K7SXooD3i74y22eQGJi+s2udr/pDha6vuDl0ByxL0epQTpCV170jcqerWa2L?=
 =?us-ascii?Q?NC11wPuUPPxhefYf4J7buvdpzSnF62/4f+s9pRAI8jx9e/e/O/LD7oFnI926?=
 =?us-ascii?Q?CS3291kimbdAnnCz7g5XKxDpI41xPoFycRh0wwCy3si1i9t8gAW28q1iYV/z?=
 =?us-ascii?Q?hl8QwLgGBn8v1qVRyrjL3BwySYfynHGWjRvc37SH8RlWk1wad1yEYBQh3E1w?=
 =?us-ascii?Q?XUCuttnWaXV/rtFZLyvXxFalNxUnDcjmC2/X9sKKBN4GLeVxTszH3nK5PQSu?=
 =?us-ascii?Q?T6Z6ePjM/RgmsnAP5llKTUecY71nTwk9OrGIGspel55ilQXcfvacaHddLPXI?=
 =?us-ascii?Q?V/nGpFeW2hcj4x3dds5VAmJQJQLDjSU5yJt3IYLLBtsby01edwwuxs5PVQuU?=
 =?us-ascii?Q?0eMtlaVZ4y4wH9Ihprjn5GdQbi63lPQJmJbEEn9Wsr82c3dkGP/khw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vijFV2csoHJIwiu+rtxCqYIVKNT4HGSxPUgE5nUG6L6YuePZ4ZK3yiACFyVk?=
 =?us-ascii?Q?DwphX5dcmt0s1xyUKPY9EQXhFLZCCLaAJ6gbpV4QtyZLRnyuBpMocIhNlbc1?=
 =?us-ascii?Q?odw3ExcqIc792VkTqnrO5xavUD/OMPXvNwmC4Hdixvqlr5MtTENRqDGxJkFv?=
 =?us-ascii?Q?0lz4nyKpJl6Hk0MRiZmV3lW+kLSBdOyPvv5xz3u3QzoY/0ha9h4J9VJjyrlZ?=
 =?us-ascii?Q?HaPU+MHnoB/9RRp0ml0c1v8Gql7tFeEss5lcEJzfW2k9G1P89hTrd+QpokeC?=
 =?us-ascii?Q?+qJ6XGVdrIA+O3npkBXnFdtEAjHe7qkIeuCl4sCyH4RLYoH2zAXGBSkyJSEs?=
 =?us-ascii?Q?1nvqVueJP6lsOVQZXuQAZ2nyRaxsR50dqisabCiO+HU1d0Q8CswHZDjJPHku?=
 =?us-ascii?Q?FaucEhJcNctkqfgR0vOkb53tUUOEG31hBHeHlDwzm9GJgXwhWBgdc7KhNmp1?=
 =?us-ascii?Q?haflS65/yOXiN4w2Q43DAQ1+thB/GXtXakqw5j8oeNNPFnTD2bwBHVWG3EWo?=
 =?us-ascii?Q?Ndkd+P+3/y7uq8w6cOrl4QZvUfZT2nDJbfJv/IXWWHjrHAqysSbled3o/Wwy?=
 =?us-ascii?Q?GBafaVmi3KTZv41uRqoj0fB7pQbcgqR5/DPH5PQJ7bHaBwBeYH+faP9ZvwZ4?=
 =?us-ascii?Q?WHsb41UH5a8k/LU7KaXv+VOfBSSics988ofall5/D4v0n1zcutLS7KYn6ZiO?=
 =?us-ascii?Q?evsBPs1xnLUOYhJGkby3+Ug3d0IaF5ZZLYYeMITZUODVxD/6B55ebc46dt5i?=
 =?us-ascii?Q?n2t6sLI2ANPDI2uaJXhVz57UN7D9qXML9qsuqzjNVRGUnN0ignCyZ7pW/+GF?=
 =?us-ascii?Q?s8Q8EqQghX6SKuWLw7wgDIBPcpyDAY8tALLCalGEqslR7xZ7P1YM0wc2zjmA?=
 =?us-ascii?Q?JIpQHzIlsibW4/ZGQiugRItkXyuQcjhhcVCbLrHhK7yEeM1z4Bk6JfilpRP4?=
 =?us-ascii?Q?k1wJgCpSvyvV1UK/7B5UFAJPvwydibodyfQT5TuyjFTJylHh3W1mvstyKmBK?=
 =?us-ascii?Q?RnO0W9O1oB1YNMWKDrkqrGesJkkWR2WWsvZgm9djI4rFbclHJhR2madjaE2p?=
 =?us-ascii?Q?irACzzklwFVGii+Q1/v2pBJGFRid1tIs+ol81b8Q7OjtP/9H30vNgCWfRWEA?=
 =?us-ascii?Q?aOpbeOHJuHKUjPkCS3jS0StXplNuga9aXh+h3+fp90WH3+a6jRt2LtSqBxYX?=
 =?us-ascii?Q?zxZ4SeWgyr5nvsgvJATJrjQRv5fmjIIQKUKXIvqQlmyMRQ+pMX0Z4/FU8cli?=
 =?us-ascii?Q?7XHOfsuLAX40e9a3+tX8D7iCQ4VQrFi57EHj8Jqj/tDVJRZSDZbc4/LGiVeO?=
 =?us-ascii?Q?6ECFWZESh9sfYiFbf8Ls36iLvL6lBuXlQ8XXQngK0IuYzPGnsmyKN1mbslM0?=
 =?us-ascii?Q?HYTqqdqaEgnu2LkxXooCXxFAdTKtuKagoEH5W290DNLx/vB0BtEpX9Ty5MZr?=
 =?us-ascii?Q?qedC6ncCOHVFn0A+tzkC1pqZb3qdd5Z4YrL1n7pmFn5jGiCsX/IqkM+sUtx5?=
 =?us-ascii?Q?Ql/fI8E7rbfY9ErXdRpqFmNLCJJWECEx1xSAGXjFpePz1nC0nG9BBDsrsZFc?=
 =?us-ascii?Q?JYldg5lBp/BVclP1utJmmxqkFx9zr1jhE//yFt/u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51174476-778e-4900-0491-08de1857742e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 08:28:22.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE99OatMz/bDfpAG0uURF6KfV7eOwCzgwOl9hObciQ8/A5uCV8tj0gLyALArMyPqNtd100T3zSAyc3VaoAgomw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_012828_289244_905FA16A 
X-CRM114-Status: GOOD (  25.43  )
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

On Thu, Oct 30, 2025 at 01:09:49PM -0700, Sean Christopherson wrote:
> Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> servicing ioctls that (a) transition the TD to a new state, i.e. when
> doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> due to racing actions, e.g. if tdh_vp_create() contends with either
> tdh_mr_extend() or tdh_mr_finalize().
> 
> For all intents and purposes, the paths in question are fully serialized,
> i.e. there's no reason to try and allow anything remotely interesting to
> happen.  Smack 'em with a big hammer instead of trying to be "nice".
> 
> Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
s/kvm_mmu_zap_all_fast/kvm_mmu_zap_memslot

> from interefering.  Use the recently-renamed kvm_arch_vcpu_unlocked_ioctl()
> to service the vCPU-scoped ioctls to avoid a lock inversion problem, e.g.
> due to taking vcpu->mutex outside kvm->lock.
> 
> See also commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
> migration if vCPU creation is in-flight"), which fixed a similar bug with
> SEV intra-host migration where an in-flight vCPU creation could race with
> a VM-wide state transition.
> 
> Define a fancy new CLASS to handle the lock+check => unlock logic with
> guard()-like syntax:
> 
>         CLASS(tdx_vm_state_guard, guard)(kvm);
>         if (IS_ERR(guard))
>                 return PTR_ERR(guard);
> 
> to simplify juggling the many locks.
> 
> Note!  Take kvm->slots_lock *after* all vcpu->mutex locks, as per KVM's
> soon-to-be-documented lock ordering rules[1].
> 
> Link: https://lore.kernel.org/all/20251016235538.171962-1-seanjc@google.com [1]
> Reported-by: Yan Zhao <yan.y.zhao@intel.com>
> Closes: https://lore.kernel.org/all/aLFiPq1smdzN3Ary@yzhao56-desk.sh.intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 59 +++++++++++++++++++++++++++++++++++-------
>  1 file changed, 49 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 57dfddd2a6cf..8bcdec049ac6 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -2653,6 +2653,46 @@ static int tdx_read_cpuid(struct kvm_vcpu *vcpu, u32 leaf, u32 sub_leaf,
>  	return -EIO;
>  }
>  
> +typedef void *tdx_vm_state_guard_t;
> +
> +static tdx_vm_state_guard_t tdx_acquire_vm_state_locks(struct kvm *kvm)
> +{
> +	int r;
> +
> +	mutex_lock(&kvm->lock);
> +
> +	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
> +		r = -EBUSY;
> +		goto out_err;
> +	}
> +
> +	r = kvm_lock_all_vcpus(kvm);
> +	if (r)
> +		goto out_err;
> +
> +	/*
> +	 * Note the unintuitive ordering!  vcpu->mutex must be taken outside
> +	 * kvm->slots_lock!
> +	 */
> +	mutex_lock(&kvm->slots_lock);
> +	return kvm;
> +
> +out_err:
> +	mutex_unlock(&kvm->lock);
> +	return ERR_PTR(r);
> +}
> +
> +static void tdx_release_vm_state_locks(struct kvm *kvm)
> +{
> +	mutex_unlock(&kvm->slots_lock);
> +	kvm_unlock_all_vcpus(kvm);
> +	mutex_unlock(&kvm->lock);
> +}
> +
> +DEFINE_CLASS(tdx_vm_state_guard, tdx_vm_state_guard_t,
> +	     if (!IS_ERR(_T)) tdx_release_vm_state_locks(_T),
> +	     tdx_acquire_vm_state_locks(kvm), struct kvm *kvm);
> +
>  static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
>  {
>  	struct kvm_tdx_init_vm __user *user_data = u64_to_user_ptr(cmd->data);
> @@ -2764,8 +2804,6 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
>  {
>  	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
>  
> -	guard(mutex)(&kvm->slots_lock);
> -
>  	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
>  		return -EINVAL;
>  
> @@ -2809,7 +2847,9 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
>  	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
>  		return tdx_get_capabilities(&tdx_cmd);
>  
> -	guard(mutex)(&kvm->lock);
> +	CLASS(tdx_vm_state_guard, guard)(kvm);
> +	if (IS_ERR(guard))
> +		return PTR_ERR(guard);
>  
>  	switch (tdx_cmd.id) {
>  	case KVM_TDX_INIT_VM:
> @@ -3113,8 +3153,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>  	if (tdx->state != VCPU_TD_STATE_INITIALIZED)
>  		return -EINVAL;
>  
> -	guard(mutex)(&kvm->slots_lock);
> -
>  	/* Once TD is finalized, the initial guest memory is fixed. */
>  	if (kvm_tdx->state == TD_STATE_RUNNABLE)
>  		return -EINVAL;
> @@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>  
>  int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  {
> -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
> +	struct kvm *kvm = vcpu->kvm;
> +	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
reverse xmas tree ?

>  	struct kvm_tdx_cmd cmd;
>  	int r;
>  
> @@ -3178,12 +3217,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  	if (r)
>  		return r;
>  
> +	CLASS(tdx_vm_state_guard, guard)(kvm);
> +	if (IS_ERR(guard))
> +		return PTR_ERR(guard);
> +
>  	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
>  		return -EINVAL;
>  
> -	if (mutex_lock_killable(&vcpu->mutex))
> -		return -EINTR;
> -
>  	vcpu_load(vcpu);
>  
>  	switch (cmd.id) {
> @@ -3200,7 +3240,6 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
>  
>  	vcpu_put(vcpu);
>  
> -	mutex_unlock(&vcpu->mutex);
>  	return r;
>  }
>  
> -- 
> 2.51.1.930.gacf6e81ea2-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
