Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2FECCF2D4
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXYZuTbhBIPIAk3fIaxLS7P2rWHa1E+1GBQTjpG28RE=; b=tcR81BuT0CAl72myI0Zf8N89C1
	xjLyDMjDeMcXLDqnAC5L3r3bk/Vwso58X3SKtNjcU/G26Ax6N7YiTdTE3ho0aTkobTQa/gmJcDGTB
	PjJPtENhFuIuFdSmisKXC3UaQO2hlNBx/NETfu6zzdaz+JZ+RWVKNupfSvPvLrpCN7wb3qnbv6+GF
	PZhAMJqvK8zgDU1qRg3e4JheExoG3lLjVJatRoTzP1VWxEaBZcHPPdpEPd9NZQIDKbptzFNY5HXg3
	ha3qcIN55DNgV0I7N+tLbqPzQSxPie9WARvZMXcqWHA+TUDDYiQJGUlvIbEO20cRcv2JDCrl3UZJE
	bQtOsAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm2y-00000001h0C-43ld;
	Mon, 19 Jan 2026 09:59:44 +0000
Received: from mail-koreacentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d40f::3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm2w-00000001gzk-1hft;
	Mon, 19 Jan 2026 09:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2AYgkTNpsnjoPT8VIOuds5oX5esHSdjMswJphOjliD4r4nC8j6hML/2Cg5KFbMpE7FfHbxOEW7TMaGiGmeqZqgRw2DXSfBdsGx+Y2V7cuxFMV4mDq0hAHGvpdbvIJm4MHLNQNy1PacGAq3uE1YUSIovp9dIAhBmez2zl8UEXMoTLkqWzvyLZcN9cmPeBeL0mz8dq6MwCw7xQN0G7uWN1ZgmwD4acZ+PrwFY9GSDaOAryaIckABnIDZDdjRZeEFksu1WvvlsiGkV7YsD5hSzLPBNytkHHIflGVuYKqBy1y1eR2VgkPF6GK1iPupn6CKiROtYyaFyIWX2LtZBWZbDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjgPFSANrCxsg8UjhsgikPONTB7QTZSLoUZfhVjT5o4=;
 b=nnalXiN2x7x9g/UWmmEkz8Z9x6wHpFeqp7hgNub1k8XhsfX6Fow3tvTz5EkhaO48wVLXCpV0FMaoCP/RPTBzzyDy5uWXly93cZld3NTWqnzH3qvt7DYga12k0mFZRel0PE4FuX27NMJgC1JdtTt+8dQ5DZYGEzX3pBOHJ9TkdRXbmcsTwM6xfkPz9IzN9yriOVM+LzheO8olVwwow/fEqcNDi7XkanjT+dnYlitAK81S3bfPs3pk07xZRdpojlWHU9/BKAI0mI/jlAg26Gv7/2FDAbBtDgIl+yC7W0V2wpBiIdOzgMXojVHCJHpAv6wu7sCIVB+JJRtpBxmHcS74Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjgPFSANrCxsg8UjhsgikPONTB7QTZSLoUZfhVjT5o4=;
 b=JdQovgUkpMd7osQ3mGeT1E7u7BdPfAefd9/cyY+Z3RV89H0rQDXy6b0kO/kFfKQ/LH8dq95PGGUaGntilb107g2HfxIxF07BbuCbNxcLhotxACaACwvOEeC7icIz546AWYKc0NTMfY8CFLuXZdAdfXZxaZVqtk/A1yKJwGqWL1t8pOnTkaGppgGmBhmkJxj72XfX8pgyFkl4UefleWoBrwd1dbXAUqvmU9LNY+rXHNtxrVcpdH098hDBCr+Bu59yJaQiHruaNW9jag+ICqB552hjuucwnfC2SOZM/7TVkvZkit4Gt6ufvD5niQLTvHrKUdfRD72nUMf0xjM/qKo8Rg==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by SEYPR04MB6896.apcprd04.prod.outlook.com (2603:1096:101:dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:59:26 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%5]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 09:59:26 +0000
Message-ID: <KUZPR04MB92655B1C5641B953F0F3D433F388A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Mon, 19 Jan 2026 17:59:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: riscv: Fix Spectre-v1 in APLIC interrupt handling
To: Lukas Gerlach <lukas.gerlach@cispa.de>, anup@brainfault.org,
 atish.patra@linux.dev
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, daniel.weber@cispa.de,
 marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be, michael.schwarz@cispa.de
References: <20260116095731.24555-1-lukas.gerlach@cispa.de>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20260116095731.24555-1-lukas.gerlach@cispa.de>
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To KUZPR04MB9265.apcprd04.prod.outlook.com
 (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <b6b27ef6-e295-49e6-b1ef-47cdb6e973af@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_|SEYPR04MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f1ae78-0e27-49a3-9389-08de57416de8
X-MS-Exchange-SLBlob-MailProps: 7J/vb0KDx3hVaBXFi3Zmt48msziUWKBFh5NPeuj9bn1S0zzitbWRlJdnuouuo2vCUdiwEnUGSP+oLMsryvh8EyUfJ5suSLP4S0sKGlxbkKy6cl/XWcc1OhwJYK16ebDmt0Pd1etOZBT2u+tX6qOLV1gtn0yk1kx/lZfLb8Hkzzdfnl4zcMcsGDcbyuuyNltU34mojffyC+dzzwGSy990RkfepLILmdIMZXrb4pYhvKJBUCsBIFlblaKZk8HtBEpkiua8zzu3JAk867vWW/vypmkwHQy1/xJENQXmPvarCL1ejRAoOMyTYWzU4k1gLTNytDizBJTirAUhAQE7CDuA3sZ9llywuNGIMnGmCb4fzrvZm3iFdIGAcdMI0+doIfDttvgvcRbwmPqElNYqHRpeUuMO+oGrZvzTQj66uJk+xS/Z8HVmH/jsFBZGAnLeKEG1kYMtKqJ9gmZPv7CybUDg4aUb1ucUNC2Fz4zI2nh1Rx656Pt8yFU4ufSHeR6s0Gg1qz4sjl7BkcxOGKBa34U5tue9FKYvJ8X2sRnKNU59KJUsXr8wWGCsm+9rOdB03qj8fjjhXy26ZM7SPk8fJ3Vt7ZTIDdn9AKQqr+vOsgofnT3oTCrFxKGsjFJvzP4fgVjo4exflvPJLOsjC/9nIs8NE2JJrfIFZNNIH0N5Jee6RUiLoN89ejKI3BhxNMRHcKtTPbg4SVGYkBZsc9XlnS6If8g/M+vJ9A+uBu/uhHvLBZ6BoLTUTTI+d/uewD22MUDZuvXdC/OLHoQvRnDBy0KrhNQw9/2IwzP0+oJkXbuIi6E=
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|15080799012|8060799015|41001999006|19110799012|6090799003|5072599009|461199028|7042599007|23021999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnNsVWZMSVBKMUZIK2E3a0hmNDJIUEs1eUZHRmRRVUFSMXNZT3V3SFdCZDRr?=
 =?utf-8?B?RlRLbmZHWUdjcWVldEVTa254Y21wTDZSOXJ2V2tDWGpJZEIxblJ5dDlzenRD?=
 =?utf-8?B?VXZnWGRyU3VpeEZ0bUdUUHVDaGQrUjBndGpZSVp5ZWl3b0twcHowbkF5U0ZO?=
 =?utf-8?B?NWUzQ3d1N2R6WEdhcENidU8zdlNvWlJhVEpmVVVwdkJPWDl4S2hrRExNQ2Ur?=
 =?utf-8?B?emRkKzR1bUZFSzdtamdGWG4reHFwYVBwTCs5ek55VDRMaDFPQmpxUU1CY0Vl?=
 =?utf-8?B?bkVtcUVISXp1Yy9vdXNhQUs5bktLRzMrb3AzeXgvTis0SkxBbk1YSHdQWEtv?=
 =?utf-8?B?NFpoM0tidlNLVkhOc2dORnNhbVdjeXQwTU5Id1BONjhkclFSZmVqRlpHcC9X?=
 =?utf-8?B?endlUWRIbXF6SU9ncWROM29GeEs3UzhuTkJ1TFErUXVMSHlnQmt2TWpaSC9j?=
 =?utf-8?B?c0JOWGJTcmlzajAxd0J5REhwcUNSTDk4RGMrMjkyOVlDVWJHclNxSEZPc2Fw?=
 =?utf-8?B?czVmWEN6MExDTTlpZU9adnFXejNWdk1QeXNyS0N3VUJLS1ZCK1hxL0hsRmpr?=
 =?utf-8?B?OXNTenpqaUZZeGt6VFZzNGsrZDE2SWJpcHh3cW5MYjdrbWgxNlJDUVdQWm16?=
 =?utf-8?B?NEM4RGs1YUJxYlFQWEIxallEMFBOZWErd1U2TVpab1FKUXVQcTN0aERrMUFi?=
 =?utf-8?B?QlB5ZmRRbFBZcDhJU1ErL3NFelVmV3p6NkNTenNoVnNlWnVnUXBKUVV3emMx?=
 =?utf-8?B?c0tIYmlMSXZ4dDg3UVVneS9XcWZ2MThkZDFHWjJyWGEwMURHcEtpMFFPV1pE?=
 =?utf-8?B?UWpidFRMN1FGRFdFOW8yRE1EdXROVCtXdHBHZlZRNjR0VjdFcHYyN2I2N2Vn?=
 =?utf-8?B?M2ErN1lYZXRab082L2dDQnBNck5wT0VQRUpWSzBBSUcyTmY2MUtSejBXY2tP?=
 =?utf-8?B?a2k1eGtrQndUaWZieG1UblhQb0p6TmdxeW4wcGpiczNQWUdSdkJXOXBTK3Zi?=
 =?utf-8?B?bjNVZ3JuNEo3TEo2ZFBBMmNFazNIV1Z4dkNnSXI4WUtORHVWTkRLMmZNNHN1?=
 =?utf-8?B?c3diVjE2YTFhZUQ0WnJFd241b2dJVDlJNG5peXQwM2JhWE9kRzBxQlRnVFAy?=
 =?utf-8?B?R0psbHF6ODNGWHg1TElrSzVvMzVkcFNCamkwR2lpZ3NFNG1zRGYra2xwVzdr?=
 =?utf-8?B?eVNXVGhmam9KT0FsK2tHK05jcXRpeFNXWW8zL28yRHNPejVIcTZ6YlBtblRB?=
 =?utf-8?B?RDVrZ09XWUFiU0hXMlQrbUdRQnptWFJMVTJQTFhNalRBbjdDWVdQdGZQT0Z6?=
 =?utf-8?B?S2J0NlVjK2gzQzFVRmlDVXhmZ2RsakxOSmVjN0ZDZzVCRk8vV0NJbW10OXpy?=
 =?utf-8?B?VDMxTkw3Si9qZ2xsNDE5b1NTdFFBczBkdWhRRy9DNE1wdnhYYkRpU3A1WC9n?=
 =?utf-8?B?bFBBQm94MGFsbm94cUdJTW1CSVNSaENSYmI1eWJsRFgvU1hOdkNpaHpOc09R?=
 =?utf-8?B?SHU3NTBsb053OXloOEttcHRPalZnOXlRWjUvclJ5cmlzNW5MTnEwSTRrMzFS?=
 =?utf-8?B?a0hTdVprOGlvc0U5NGlQZktsS2s2Q3ZjbnVkTXJaSXNqY0tBSnYzZUJ0VU4x?=
 =?utf-8?B?QXl2SkIyZ0t5VmF2Q2xBY1JaUlcwLzZoZGZCNlJONU9YYnZOZTNJSVF6cEpi?=
 =?utf-8?B?cmdJenpUWXEwNjVBdXhoTmJiUVBjNzZUYldGZ3V5bm1VNTRISEhlaGhRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExPcG80c0NtTlQxLzVyZmFYdnN3bndDYkpaMU5WZDFNM2U5a01GT2EyWE1m?=
 =?utf-8?B?SDJud0tyM1R0eUk2VkhLWDl6eXhhdURrRmI3dmVaY2ZYOGhMM0l1bnZteUpQ?=
 =?utf-8?B?WG5NR1lOVC9LdkZ5eFlpK0ZuOWxrODNieXZBanVoMmVSUzRXMUZRQ3A3dXVD?=
 =?utf-8?B?cElRNm5YaXpma3ZVS0JnK2pjd2VheStNSUxNdkhMaCs5UWpHQkN3RHZsMVpH?=
 =?utf-8?B?V2I4T2RZMFVFc1BFTS8vdndnbjlmZEVLMnBrV0hEZDhQUzlGS1J0TmdtRkVv?=
 =?utf-8?B?M3Nlbjl5NXJGTnFjcGxlT2JrL3QrUndEUkpNLzh5Ni9FU1QwTml2dXZVa3Bx?=
 =?utf-8?B?d0JCS2RhQlQ5bzhVQ0tOdUtqeEJ0NlJQSGRjZzlzWGFkdURRbU13SFQzRyto?=
 =?utf-8?B?NFM1U1E4aEVXTzhlN1c5NEpMMzVUK1p0M0dZaDRyN1Y1MVRLdldQUFNRWHlr?=
 =?utf-8?B?eERRUWd1amhLV0tDNzYwMVF2RFBUY2VnY2tveTBlYlhKTFREandsU3ZmKzRI?=
 =?utf-8?B?SHptZXhDck5CWnZ6R3A3Q25yRGJBMEEzNzNIMlZ6NHpxOGdLZjUwQXgvQk1M?=
 =?utf-8?B?QTM0MlFzdy80WUpmZ1UzK1RyZnJQanpEdExOUHlOamlNeDdvSUNrbnU5TDlx?=
 =?utf-8?B?YXFsaWpYc1lwY2pzbUt0U1Z5SUFBUUJMamc3ZlZmaGtuZUptZFNmR2VXZlk3?=
 =?utf-8?B?aXcxV1FVYzJlOXhXdHFHRTl3b3FJUlZGRHdhdk1FWWhpUUR2Z2RYTjd4Rk0v?=
 =?utf-8?B?Q1ZkSlZqN0RzaWg4VC9wc0ZZdHQxTzZBbXdESWh0eWIzbHhMRG0rZk43WHVM?=
 =?utf-8?B?U2F3SVh6d2JzSk5EYmVmSWtuTCs0T3VZdHh2VjlpeithcndybU9MdzFrT2t5?=
 =?utf-8?B?RTlJWTl5V3NxbWpPTDNhQWhvajBPM2toZlM3YjZtZm5kQmJVN1A4VHhkalJz?=
 =?utf-8?B?M25paGw2QWczZHhFVkZsaXA3a05pRHVmcU1LN2NGTmNQdzlWeW16bmpUS3NS?=
 =?utf-8?B?THJJMGlPZjlabm9ObVh5Y1F4OCttcGE5MjJDOXU3OFNVdzQ1RWYwdWd4U0N3?=
 =?utf-8?B?aVdyTkg4OVQ5TXhBZzBQTW05R0tpZU1HeEhoaUdFeGVRdEdkU2hpS1JaZ08x?=
 =?utf-8?B?VG0xU0VBYmU0aHY4RlVsa1RrYXZIanNISkRua3dWbndDem1PSWdIT0JUYXVx?=
 =?utf-8?B?bjlKcU1pSGNRVTVyS3h2WEdwM044SFpCRVBoeUd2MnhsekRQYStFd241K1Nw?=
 =?utf-8?B?Vkk5aXM3NncveENsUnlIKzlwRnZjL0txUjJOQ1RoZHBFRCt4MTdlbEVnZE82?=
 =?utf-8?B?cHVtOWNUalR2d0tVT1J2Vk0xdS9BYnpHWmwvRi9Mb1FXM3prdzl6dTF6NEU1?=
 =?utf-8?B?cXpWWXpUVktxZ0ZHVGNtY1ZpYXVrdkY4Z1NPeXVFb05DZzMwc2hseG5veHM3?=
 =?utf-8?B?ZnR3aFp0b09LZW0rS1VIdXhjaWZ2NlVoc0Jva05YOHJlTDZ2cXlvQWdyNjJi?=
 =?utf-8?B?SmNOM3FKTG9Ka0RoNmtVWnhQNUdIbzZIRzkxMERDUXNwM0c1Wm1TVm8yUGpy?=
 =?utf-8?B?MXVvTVZoaXpDU0ZTRXo0L0FuVWtHcjh6bm4xcmd3NnZSbm9VeGl6SEF4RXY0?=
 =?utf-8?B?WXhCclNpek5DZ2NTRzdVQW56TE5sTEo0RFcvOEt2cTdPMnJEczVxcXhDTkFU?=
 =?utf-8?B?VEhwaDJJaHlmSExYNXhsTU5TTW00d1Y0WFZkWWpHNmdobEVidmhaYnJ5dHNO?=
 =?utf-8?B?SDYrSWQ1eHlzemYzU1E3aHlNQkJoOEU2eVJNT0p1dnc0V2N4Q1VCamIzZ3RN?=
 =?utf-8?B?Wnoxcm5zbHBPa2VoZDhhbmZ2dkhCTlllWjI1Z3E3WE1sMEp1dDNVNGtMbjNi?=
 =?utf-8?Q?HzCXg+KUyKvL4?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-515b2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f1ae78-0e27-49a3-9389-08de57416de8
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:59:26.6871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_015942_614262_02DDCBE6 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8xNi8yMDI2IDU6NTcgUE0sIEx1a2FzIEdlcmxhY2ggd3JvdGU6Cj4gR3Vlc3RzIGNhbiBj
b250cm9sIElSUSBpbmRpY2VzIHZpYSBNTUlPLiBTYW5pdGl6ZSB0aGVtIHdpdGgKPiBhcnJheV9p
bmRleF9ub3NwZWMoKSB0byBwcmV2ZW50IHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZHMgYWNjZXNz
Cj4gdG8gdGhlIGFwbGljLT5pcnFzW10gYXJyYXkuCj4KPiBTaW1pbGFyIHRvIGFybTY0IGNvbW1p
dCA0MWI4NzU5OWM3NDMgKCJLVk06IGFybS9hcm02NDogdmdpYzogZml4IHBvc3NpYmxlCj4gc3Bl
Y3RyZS12MSBpbiB2Z2ljX2dldF9pcnEoKSIpIGFuZCB4ODYgY29tbWl0IDhjODY0MDVmNjA2YyAo
IktWTTogeDg2Ogo+IFByb3RlY3QgaW9hcGljX3JlYWRfaW5kaXJlY3QoKSBmcm9tIFNwZWN0cmUt
djEvTDFURiBhdHRhY2tzIikuCj4KPiBGaXhlczogNzQ5NjdhYTIwOGUyICgiUklTQy1WOiBLVk06
IEFkZCBpbi1rZXJuZWwgZW11bGF0aW9uIG9mIEFJQSBBUExJQyIpCj4gU2lnbmVkLW9mZi1ieTog
THVrYXMgR2VybGFjaCA8bHVrYXMuZ2VybGFjaEBjaXNwYS5kZT4KPiAtLS0KPiAgIGFyY2gvcmlz
Y3Yva3ZtL2FpYV9hcGxpYy5jIHwgMjMgKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxp
Yy5jCj4gaW5kZXggZjU5ZDFjMGM4YzQzLi5hMmI4MzFlNTdlY2QgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMu
Ywo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICAjaW5jbHVkZSA8bGludXgvaXJxY2hpcC9yaXNjdi1h
cGxpYy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+Cj4gICAjaW5jbHVkZSA8bGlu
dXgvbWF0aC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbm9zcGVjLmg+Cj4gICAjaW5jbHVkZSA8bGlu
dXgvc3BpbmxvY2suaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zd2FiLmg+Cj4gICAjaW5jbHVkZSA8
a3ZtL2lvZGV2Lmg+Cj4gQEAgLTQ1LDcgKzQ2LDcgQEAgc3RhdGljIHUzMiBhcGxpY19yZWFkX3Nv
dXJjZWNmZyhzdHJ1Y3QgYXBsaWMgKmFwbGljLCB1MzIgaXJxKQo+Cj4gICAJaWYgKCFpcnEgfHwg
YXBsaWMtPm5yX2lycXMgPD0gaXJxKQo+ICAgCQlyZXR1cm4gMDsKPiAtCWlycWQgPSAmYXBsaWMt
PmlycXNbaXJxXTsKPiArCWlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5kZXhfbm9zcGVjKGly
cSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+
bG9jaywgZmxhZ3MpOwo+ICAgCXJldCA9IGlycWQtPnNvdXJjZWNmZzsKPiBAQCAtNjEsNyArNjIs
NyBAQCBzdGF0aWMgdm9pZCBhcGxpY193cml0ZV9zb3VyY2VjZmcoc3RydWN0IGFwbGljICphcGxp
YywgdTMyIGlycSwgdTMyIHZhbCkKPgo+ICAgCWlmICghaXJxIHx8IGFwbGljLT5ucl9pcnFzIDw9
IGlycSkKPiAgIAkJcmV0dXJuOwo+IC0JaXJxZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwo+ICsJaXJx
ZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyld
Owo+Cj4gICAJaWYgKHZhbCAmIEFQTElDX1NPVVJDRUNGR19EKQo+ICAgCQl2YWwgPSAwOwo+IEBA
IC04MSw3ICs4Miw3IEBAIHN0YXRpYyB1MzIgYXBsaWNfcmVhZF90YXJnZXQoc3RydWN0IGFwbGlj
ICphcGxpYywgdTMyIGlycSkKPgo+ICAgCWlmICghaXJxIHx8IGFwbGljLT5ucl9pcnFzIDw9IGly
cSkKPiAgIAkJcmV0dXJuIDA7Cj4gLQlpcnFkID0gJmFwbGljLT5pcnFzW2lycV07Cj4gKwlpcnFk
ID0gJmFwbGljLT5pcnFzW2FycmF5X2luZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07
Cj4KPiAgIAlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAgIAly
ZXQgPSBpcnFkLT50YXJnZXQ7Cj4gQEAgLTk3LDcgKzk4LDcgQEAgc3RhdGljIHZvaWQgYXBsaWNf
d3JpdGVfdGFyZ2V0KHN0cnVjdCBhcGxpYyAqYXBsaWMsIHUzMiBpcnEsIHUzMiB2YWwpCj4KPiAg
IAlpZiAoIWlycSB8fCBhcGxpYy0+bnJfaXJxcyA8PSBpcnEpCj4gICAJCXJldHVybjsKPiAtCWly
cWQgPSAmYXBsaWMtPmlycXNbaXJxXTsKPiArCWlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5k
ZXhfbm9zcGVjKGlycSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgCXZhbCAmPSBBUExJQ19UQVJH
RVRfRUlJRF9NQVNLIHwKPiAgIAkgICAgICAgKEFQTElDX1RBUkdFVF9IQVJUX0lEWF9NQVNLIDw8
IEFQTElDX1RBUkdFVF9IQVJUX0lEWF9TSElGVCkgfAo+IEBAIC0xMTYsNyArMTE3LDcgQEAgc3Rh
dGljIGJvb2wgYXBsaWNfcmVhZF9wZW5kaW5nKHN0cnVjdCBhcGxpYyAqYXBsaWMsIHUzMiBpcnEp
Cj4KPiAgIAlpZiAoIWlycSB8fCBhcGxpYy0+bnJfaXJxcyA8PSBpcnEpCj4gICAJCXJldHVybiBm
YWxzZTsKPiAtCWlycWQgPSAmYXBsaWMtPmlycXNbaXJxXTsKPiArCWlycWQgPSAmYXBsaWMtPmly
cXNbYXJyYXlfaW5kZXhfbm9zcGVjKGlycSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgCXJhd19z
cGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+ICAgCXJldCA9IChpcnFkLT5z
dGF0ZSAmIEFQTElDX0lSUV9TVEFURV9QRU5ESU5HKSA/IHRydWUgOiBmYWxzZTsKPiBAQCAtMTMy
LDcgKzEzMyw3IEBAIHN0YXRpYyB2b2lkIGFwbGljX3dyaXRlX3BlbmRpbmcoc3RydWN0IGFwbGlj
ICphcGxpYywgdTMyIGlycSwgYm9vbCBwZW5kaW5nKQo+Cj4gICAJaWYgKCFpcnEgfHwgYXBsaWMt
Pm5yX2lycXMgPD0gaXJxKQo+ICAgCQlyZXR1cm47Cj4gLQlpcnFkID0gJmFwbGljLT5pcnFzW2ly
cV07Cj4gKwlpcnFkID0gJmFwbGljLT5pcnFzW2FycmF5X2luZGV4X25vc3BlYyhpcnEsIGFwbGlj
LT5ucl9pcnFzKV07Cj4KPiAgIAlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZs
YWdzKTsKPgo+IEBAIC0xNzAsNyArMTcxLDcgQEAgc3RhdGljIGJvb2wgYXBsaWNfcmVhZF9lbmFi
bGVkKHN0cnVjdCBhcGxpYyAqYXBsaWMsIHUzMiBpcnEpCj4KPiAgIAlpZiAoIWlycSB8fCBhcGxp
Yy0+bnJfaXJxcyA8PSBpcnEpCj4gICAJCXJldHVybiBmYWxzZTsKPiAtCWlycWQgPSAmYXBsaWMt
PmlycXNbaXJxXTsKPiArCWlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5kZXhfbm9zcGVjKGly
cSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgCXJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+
bG9jaywgZmxhZ3MpOwo+ICAgCXJldCA9IChpcnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9F
TkFCTEVEKSA/IHRydWUgOiBmYWxzZTsKPiBAQCAtMTg2LDcgKzE4Nyw3IEBAIHN0YXRpYyB2b2lk
IGFwbGljX3dyaXRlX2VuYWJsZWQoc3RydWN0IGFwbGljICphcGxpYywgdTMyIGlycSwgYm9vbCBl
bmFibGVkKQo+Cj4gICAJaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2lycXMgPD0gaXJxKQo+ICAgCQly
ZXR1cm47Cj4gLQlpcnFkID0gJmFwbGljLT5pcnFzW2lycV07Cj4gKwlpcnFkID0gJmFwbGljLT5p
cnFzW2FycmF5X2luZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgIAlyYXdf
c3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAgIAlpZiAoZW5hYmxlZCkK
PiBAQCAtMjA1LDcgKzIwNiw3IEBAIHN0YXRpYyBib29sIGFwbGljX3JlYWRfaW5wdXQoc3RydWN0
IGFwbGljICphcGxpYywgdTMyIGlycSkKPgo+ICAgCWlmICghaXJxIHx8IGFwbGljLT5ucl9pcnFz
IDw9IGlycSkKPiAgIAkJcmV0dXJuIGZhbHNlOwo+IC0JaXJxZCA9ICZhcGxpYy0+aXJxc1tpcnFd
Owo+ICsJaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+
bnJfaXJxcyldOwo+Cj4gICAJcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZpcnFkLT5sb2NrLCBmbGFn
cyk7Cj4KPiBAQCAtMjU0LDcgKzI1NSw3IEBAIHN0YXRpYyB2b2lkIGFwbGljX3VwZGF0ZV9pcnFf
cmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCB1MzIgZmlyc3QsIHUzMiBsYXN0KQo+ICAgCWZvciAoaXJx
ID0gZmlyc3Q7IGlycSA8PSBsYXN0OyBpcnErKykgewo+ICAgCQlpZiAoIWlycSB8fCBhcGxpYy0+
bnJfaXJxcyA8PSBpcnEpCj4gICAJCQljb250aW51ZTsKU2VlbXMgdGhlIGFib3ZlIGNvZGUgd291
bGQgYmUgYmV0dGVyIGFzIGZvbGxvd3MgPwogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaWYgKCFpcnEpCmNvbnRpbnVlOwogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgaWYoYXBsaWMtPm5yX2lycXMgPD0gaXJxKQogwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuOwoKT3RoZXJ3
aXNlLApSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+CgpUaGFu
a3MsCk51dHR5Cj4gLQkJaXJxZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwo+ICsJCWlycWQgPSAmYXBs
aWMtPmlycXNbYXJyYXlfaW5kZXhfbm9zcGVjKGlycSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAg
CQlyYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPgo+IEBAIC0yODMs
NyArMjg0LDcgQEAgaW50IGt2bV9yaXNjdl9haWFfYXBsaWNfaW5qZWN0KHN0cnVjdCBrdm0gKmt2
bSwgdTMyIHNvdXJjZSwgYm9vbCBsZXZlbCkKPgo+ICAgCWlmICghYXBsaWMgfHwgIXNvdXJjZSB8
fCAoYXBsaWMtPm5yX2lycXMgPD0gc291cmNlKSkKPiAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4gLQlp
cnFkID0gJmFwbGljLT5pcnFzW3NvdXJjZV07Cj4gKwlpcnFkID0gJmFwbGljLT5pcnFzW2FycmF5
X2luZGV4X25vc3BlYyhzb3VyY2UsIGFwbGljLT5ucl9pcnFzKV07Cj4gICAJaWUgPSAoYXBsaWMt
PmRvbWFpbmNmZyAmIEFQTElDX0RPTUFJTkNGR19JRSkgPyB0cnVlIDogZmFsc2U7Cj4KPiAgIAly
YXdfc3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAtLQo+IDIuNTEuMAo+
Cj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
