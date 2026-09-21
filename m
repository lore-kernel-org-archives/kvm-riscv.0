Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92252C982E6
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/ZqLkqQcELMReM5eAjzJPhJkVkd2S2gphZ7HKaWtaDM=; b=ef8vp27XTnWfeLW0eGI6c1oq/Y
	HncLoHogSOQWKundlOBUQctdDWU044D6a9NerCJ9kB1vzLMW5zBx30NA1wWkXb3q2UrgeSjZfe7GN
	wDPEZxLxM0Ac75TST7nFiyYF6BugGiSqQPwNEF3t9Qh3WE+0vDVxFYlYz815DwnLqoVmqhrGoMTju
	+cmkgUjSYKR+vibME/+onN96TdKgymhae8kq34Qy8mbbCdcNsw+R33uIHi73jCdU1wucu1mADFHs6
	qZNEecx1qmyW30USyorrgpWc78gtx6En0VxXbuXHVZ30YqiX2CK3P7gwpVe1aK9N8hWE/zQpO1tkf
	ro/tOYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lMm-00000003RWQ-0UNC;
	Mon, 21 Sep 2026 21:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8lMj-00000003RVX-1Hlh;
	Mon, 21 Sep 2026 21:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:To:Subject:Cc:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fssjnakAwX4Aot0ReFg0roa8e4/oDQDWx8US/n+1cwI=; b=BmPQ//y4c+y8ltL6rDu2/zA4sO
	TJYeM2m1UVUN08H4YTF/DPxc1jlZEaTE9gB9kjzTd7d2/L6mw8KybmtlJHrchLB1lEJluPSL/ZBYK
	SGMhhW3nIeQW+liUcgpfumT1akssOhQSPZEIEN13+yT5LT+t0JwcBOiW7OvaNq0A2OCF7sLxbpd+7
	EGJlfx2Gujb0MWjdOFQbKSiFhkfZGcqB26s2/3gAcmj8zTPUHed/k/reNi7O/q5ur4eELFO9Gsqjm
	+7oCuoMGXvbQ0hrYoTisKaGdECN5lvY4E8SzbRh1rHflaPCzqViSTELDw8+0RD3iV+AycY3wwKr0Y
	R5GxIhNg==;
Received: from mail-northeuropeazon11012069.outbound.protection.outlook.com ([52.101.66.69] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8lJT-0000000Cph1-0G0T;
	Mon, 21 Sep 2026 21:15:55 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=At501vIPK0D95G0+5oa/eAvo/gs55DrnspX3Um15Ya6IKN6EilFTrm15lF3Qr+n9JAA8Oibda88xF1rmecFEY5CL3Orp7gmMxD6tcv2RB6MweQvcS/gUVzXd0ZduMApAe+HUbkvbXbt6RR4eFyEpOKv2aoqkoG7FIUP6YKUgzw4j6tyFciteY1d8BTtH9rQZxpp3RWofzNDPIWy/VGUzNDkrzK6yI/hdA+xutqCm4MUXNMMOq7o4h8DmwZRA2AxFZgKRttDwDeBmd8DnSf2SaWoWfaySD8tTjMHcPiikzKL5/FB2u3crduEMeAFJlDSmqsgHjzmybnURsDAD4zZ46A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fssjnakAwX4Aot0ReFg0roa8e4/oDQDWx8US/n+1cwI=;
 b=yc4HOZlYGB0pxaO8vW7ebsErhUSkFdzqO/zwNjrgx+eY7+C5Hu6HQ/Bcb3vtqUzKV1dGhqoy1Ic0HJe4cMMfoQup5QgE7/qhxOjHdIuJksVAWC13UqT0tj9XjjlL08U8W6Lpifu/s3pYCof3hcJwdGpEE+KYRn9vXeYR/Yqc51Lzv+eTTeVj4RN425BYzCh0T2ivYGMiNjR9Eff2zrDoBmqZ0MQOPk5g2cY7Ac7DMI7piMZupiKnDxFjuopBiuASD28bdTcpX0nTTjQJc4wuSpuwj0lNUv4cpItlEiyekOr22I+Oxdh09fjQlC2T5puMWKsZfht4cqIHVuUERCeUYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fssjnakAwX4Aot0ReFg0roa8e4/oDQDWx8US/n+1cwI=;
 b=hxbskqefDT+K8DvxSO/ArBHoTe3NZIxbUDGs+sy9ObdlbwYXYPbYv2HfKwl/Jh9Nz5O2QTJEgU3tx4EoQYWHOdUG0vxyOF7rgfxTuq/Voxb04Ptqm1bkJBaVr5mieZAZIz0yxhISVzkd5XhBCFZyjK7CdyZSlwzEvBMpFxlLvIc=
Received: from AS4P250CA0016.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::8)
 by GV2PR08MB9376.eurprd08.prod.outlook.com (2603:10a6:150:d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 21:11:59 +0000
Received: from CPH1EPF0000052A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::20) by AS4P250CA0016.outlook.office365.com
 (2603:10a6:20b:5e3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 21:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000052A.mail.protection.outlook.com (10.167.241.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 21:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh/L8IkuQ9fdNcJn27UMo85nIp6FumR0rJZajvV2yW62VRe0CzPEhhhlx+LnlgP39TGJmegDZ7XDxf7Rd+zEkQ6yay6nLeXg8r/QFz7PTtbYK3DDHL4EcmEYH0I2nnXyPWFoG8VNxA9ptv3pHbGHwQpfBsd/igpOEt714pHp6Zyi56YsnL0RFPKT1//Fv7Djrd6tsyuw6UWOkHV7yT1+xWwmEwu3YsCSP6nCoqrslylbSbLBeMcXTCBUNdogBappB7+wsYTgcvg0FpKF5DUDbT782j6SdgZBxWIVMx7/202VMi9im6TDCZ/+WTjHsWOm6N3yEKkcZ9lrdqIhVzErmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fssjnakAwX4Aot0ReFg0roa8e4/oDQDWx8US/n+1cwI=;
 b=NC5bg//OTzh0+VL7CE+SHIjlW5gztg+ayC7augPAFpeP1ychSjJy2h9aq4f4nxd5gTu2VCn5alfzg1PiX24mBkWqK7ZjN9gxhVlL06rHCw5DgEw5BuMEIOLTBTWG7vN4EO3pLneHGeoX9IE8BBGg0fonoA5MO/uLDslwu9IFxQSUNCoT9QOXjdLWfW/Iw1GZyt58EO//Hh0M31qXZCdzdLK3jDKUez0UyZjHhE8VIRZnurdpBjJ47gK3y+h8/v5PSd7EpGhogBudaTFuVPVWp94m28IWZEJqAWjjlF5b8MVXtIPqb2UwHEs0WZQZpbXOPUYjeRpJoXhRW2uPp/cT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fssjnakAwX4Aot0ReFg0roa8e4/oDQDWx8US/n+1cwI=;
 b=hxbskqefDT+K8DvxSO/ArBHoTe3NZIxbUDGs+sy9ObdlbwYXYPbYv2HfKwl/Jh9Nz5O2QTJEgU3tx4EoQYWHOdUG0vxyOF7rgfxTuq/Voxb04Ptqm1bkJBaVr5mieZAZIz0yxhISVzkd5XhBCFZyjK7CdyZSlwzEvBMpFxlLvIc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3414.eurprd08.prod.outlook.com (2603:10a6:20b:49::10)
 by DBAPR08MB5782.eurprd08.prod.outlook.com (2603:10a6:10:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 21:11:23 +0000
Received: from AM6PR08MB3414.eurprd08.prod.outlook.com
 ([fe80::dde8:bf0b:1dc:2a2]) by AM6PR08MB3414.eurprd08.prod.outlook.com
 ([fe80::dde8:bf0b:1dc:2a2%5]) with mapi id 15.21.0451.012; Mon, 21 Sep 2026
 21:11:21 +0000
Message-ID: <81b1fec1-3b5e-43ed-a5b3-1a73c80201d8@arm.com>
Date: Mon, 21 Sep 2026 22:11:04 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-openrisc@vger.kernel.org,
 Sohil Mehta <sohil.mehta@intel.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 00/21] mm: change behavior of pXdp_get()/pXd_page() in
 compile-time folded pgtable
To: Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
X-ClientProxiedBy: PR3P189CA0087.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::32) To AM6PR08MB3414.eurprd08.prod.outlook.com
 (2603:10a6:20b:49::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3414:EE_|DBAPR08MB5782:EE_|CPH1EPF0000052A:EE_|GV2PR08MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c65256-2298-46f2-2c61-08df1824f908
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|3023799007|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: p2oDKWs+FEtkXEk/rhmMKOX2JqsVABKRRmgnUJBXP8+q5UHXMA3h1Kawyarg5G2d4lmnKXe6/lbPWbTRyvtZdQQ7bnahGip+88eTMSnnDZT/x/KlpWcHsQ5L5nsElVtFTD8QYKT2wk13FfQiXiGB+XYsRvW1YPN+gastoU4MpOKo1pYl3MlRQh5sUfSheCo7aOiljin8RScTGDpc+KL0w2+9lkpCgg/dt8iOPbScSWq+zM9AbEGXT6XUzs/JG4C2gQ9L5H9oelVVF81PrhRuZQE52k4YtrCfbU5xXoaC7JkPKdGEtWEMMZb3gVp7eWQ38O+P+605uqZKr1oeZ+b4mQj2RIhUIf60Y2exPChbw0mFF1c/WHZDXXCBmXPmzcIfshiyingzOF3GJDuzSd1uhV+40iim/W9Zh10bDyik9zXGf7Fs7iv9oV0pYOnUB8J4CugUZB9s/sJVXRlHJ9P4JPs3KGB4gnUY1MO5mr1GcKVFdcTk90IOqFCnON5hSFSoNNEDL/FQhBniIFOrxwtvPmTydAdMUvUo7F8EoLwGsSgvMiiJNCFNos9IfUg3NLvCcVBw7zHEJuAgdBcpY3nYem3Nf3nivS6Ay5jGWNkOIoUah7xG12xORFo5cCWjWbLS
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: MN4fXV7rjyz1upSoyRduzOkezfp0p/LvCjoQxKTX/SX9IbSysCl0nKOGcBWIb50fZWzzWpJD6e4pVkzQrXlZyicYjb4PPnjtCNtc+PtzJ6W3to8hpSjIm9EFhDYTxNKpS+dQF59bTjWZJFzSscdhYZoAcF25v9qBWGQM8jIIA6QeW/tNdSA6QQmpGq3Lohf913dr3Gt/QdFVdwi98GHZhA6D9rBfuWXPRFo7/uUAKXp1Yby52wU3ManutuyhN1hfCPHqMRueRnXy1z5ezPx9IM3N85gjpNf3dppzRS1zr7oHhqAqqcHuL419DuXBHZgj0KhoUUKxXIwEmXAmCYqJyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5782
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CPH1EPF0000052A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6d20812-e8ad-4f65-c345-08df1824da1d
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|35042699022|7416014|14060799003|1800799024|82310400026|36860700016|376014|13003099007|3023799007|6133799003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: AWC1PFfT5KfqXNMUOjVgVZ7xgjnxueEK+PS6Pt0n55MoYqjY8PpZpoWxUeltRfPwjlZdty1jK//VDJjOhdoavPycXMp46gjN9wrt6MxmLnYS0tl0H7hlgFRpfctkNK9vGrosnJm4Uzl7rAFZMCR9595ro42rpGfPUJdjIY+T0jFQr7aO8Wnz8rgREEe6pDmAtvX+JUwzp9tNGFME4tcURUFKZDg7C9h87hSbqG5uyhNDqUFZhl3RjYZefcFTt/ABz4S8eauU0N6MBcSxG+YPPTp539xK/JnNkYf4Xqfx4dopYENsvclNl8ZdkRWI5GGv670YxNmEW3Bj/fS5shk5a8AezgPEZaKcf0z89ReJtlmtw+IVMV3sXEfKxZwnX1kQlFyc2vosf7dg0CZSUcAPp/QxKLltX/bbOdv4euwkqNbf8Z8FcQawY82K4YQB1aaeNQQtu3Eva5++h4r9JTuYCpzTe3FJgwvVt6CwmOIKMQd6kQi7oCjoRavTiHDc9goi1SofK3IBw66Sck/A+mNwRPX2STGfJCixYTd4NtJ8ucuY8wdop5OZCkdjNb7mpKe2SMn+VROvm+SCQYexcxf6MDVUnhZtp+HgfKBWoHtArK9L+pX/SyDzxfGfFo2eJDBAe8fl40daLteJbK6UqO8xTXQjbCNmTUkKmmKdd7ho64s=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(7416014)(14060799003)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(3023799007)(6133799003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +14LHJ1xGwhQZYcCuxNcd+vJokl8LMpUlaa9qmTyP8ggEjcxBGY6rGMEWobJULEEpq2RP53YM8TBQ1gox7jyXnw2bBlbBxR2z/MvyLdrPymMNd88U9i/8Vb3Fal/2xRFhra6V2gnrZ67muTE0t3b/vW6thavz8jhQ1I16V73uIRaxcx/f7jPXpPWTlF1tq3D5YOigljJSHq8XjmjaUlyCDo9LkpTbGQyd2TJwUMeuYU7SBWYveHagzcjiFThYYvZsCsdgK0czExhsCdYKdFJUqy43rvw28VGBTjzPINDrO/FzpKp3iUBF4xAmeFNhJcZ9O8KIqNREowFP7b9Yqo3ZzexzdME1ejtcmL1bnHthnU6IHxI2XBffXAe6/syZHb3sVjSl6CLaMB6Al1puLoqYUHCo97lPnf75j4hxEoF92vFx6L6QREEO33sMurUmAaU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:11:58.4641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c65256-2298-46f2-2c61-08df1824f908
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000052A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_221354_340572_52BD0962 
X-CRM114-Status: GOOD (  21.53  )
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

On 21/09/2026 11:55 am, Yeoreum Yun wrote:
> Using ptep_get() and its counterparts in common code is suboptimal on
> kernel configurations with generic compile-time folded page tables.
> By default, ptep_get() and its friends expands to READ_ONCE(),
> forcing the compiler to emit a load even when the value is not used afterwards.
> 
> This issue was recently reported by Christophe Leroy [1] for ppc32
> preventing futher code conversion to ptep_get()/pmdp_get()/... helper
> and the same behavior can also be observed on arm64 when built with
> 2- or 3-level page tables
> 
> e.g) perf_get_page_size() in arm64 with CONFIG_PGTABLE_LEVEL=3:
> 
> 00000000000052a0 <perf_get_page_size>:
>     ...
>     52dc: d53b4234     	mrs	x20, DAIF
>     52e0: d50343df     	msr	DAIFSet, #0x3
>     ...
>     52fc: d35e9a69     	ubfx	x9, x19, #30, #9        /* pud_offset_lockless() */
>     5300: f9403508     	ldr	x8, [x8, #0x68]
>     5304: f869790a     	ldr	x10, [x8, x9, lsl #3]   /* pudp_get() */
>     5308: f90007ea     	str	x10, [sp, #0x8]
>     530c: f8697908     	ldr	x8, [x8, x9, lsl #3]    /* pudp_get() */
>     ...
>     5360: 90000009     	adrp	x9, 0x5000 <perf_prepare_sample+0x548>
>     5364: 92746908     	and	x8, x8, #0x7ffffff000
>     5368: d3557675     	ubfx	x21, x19, #21, #9       /* pmd_offset_lockless() */
>     ...
>     5394: f8757ac8     	ldr	x8, [x22, x21, lsl #3]  /* pmdp_get() */
> 
> Though PGTABLE_LEVEL=3, since the pudp_get() still remain with
> READ_ONCE(), there's redundant load for the pud which is folded.
> 
> To prevent generating suboptimal code, make pXdp_get() return a dummy
> entry for compile-time folded page tables, make the helpers such as
> pXd_offset()/pXd_offset_lockless(), set_pXd() validate dummy entries
> at compile time to catch the wrong usage and prohibit calls to
> pXd_page() in pgtable-nopXd.h.
> 
> This series does not change the behaviour of existing code that directly
> manipulates folded page-table levels using set_pgd(), pgd_page_vaddr(), and
> related helpers. Those helpers continue to behave as before.
> 
> The new restrictions only apply to code that adopts the pXdp_get()-based
> access model for compile-time folded page tables.
> 
> As the pXdp_get() can return *dummy* entry, some of code using
> the stack value where saves the pXdp_get() could be a problematic:
> 
>   1. Passing address of stack value where saves the pXdp_get() result
>      to pXd_offset() for example:
> 
>        pud_t *pudp, pud;
>        pmd_t *pmdp;
> 
>        pud = pudp_get(pudp, address);
>        pmdp = pmd_offset(&pud, pud, address);
> 
>      (e.g. host_pfn_mapping_level() in loongarch).
> 
>   2. Using the pXdp_get() result to use as argument of pXd_val() and
>      to check prot without checking pgtable is folded.
>      for example, x86's effective_prot().
> 
>   3. Using set_pXd() with pXdp_get() will set problematic dummy entry
>      in folded page table like:
> 
>        set_pXd(pxdp, pXdp_get(pxdp_k));
> 
>   4. Using pgd_page_vaddr() to get the first-level pgtable.
>      passing dummy pxdp_get() for pgd_page_vaddr() will return wrong
>      address. Therefore, make pgd_page_vaddr() and pXd_pgtable() to
>      trigger the error for improper usage with folded dummy entry in the
>      generic compile-time folded pgtable.
> 
> Thanksfully, above cases are rare since (1) most of usage using
> pXd_offset() with result of upper pXd_offset(), (2) it's extreamely
> rare to use pXd_val() for non-leaf entry in the kernel,
> (3) is to handle the vmalloc_fault or set the first level of page table
> and (4) to setup early page table and etc.
> 
> Therefore, properly handle this uncommon and problematic pattern, and
> document the current design of compile-time folded page tables.
> 
> This patch is based on mm-unstable.
> 
> Future work
> ===========
>  - print_bad_page_map() and show_pte() still prints dummy values
>    instead of printing the same content for all generic compile-time
>    folded page tables. We might want to skip printing dummy values later.
> 
>  - We currently catch abuse of dummy values on the stack at compile-time by
>    relying on constant propagation by the compiler. Usama's work [3] on using
>    distinct types for sw vs. hw PTEs could help here as well."
> 
>  - Clean up vmalloc fault handling by synchronizing the vmalloc entry on
>    32-bit architectures. This code is almost identical across architectures.
> 
>  - Unfortunately, the current design of compile-time folded page tables appears
>    to be internally consistent but confusing. For example,
>    when CONFIG_PGTABLE_LEVELS is 2, p4d, pud, and pmd are expected to
>    be folded into pgd. However, the architecture code uses set_pmd()
>    to update the top-level page-table entry, even though it includes pgtable-nopmd.h.
> 
>    In the future, it would be good to eliminate this source of confusion,
>    possibly by treating all folded upper levels consistently as dummy wrappers
>    around the highest real page-table level:
> 
>          NOPGD
>    --> +------+           P4D
>        | ptr0 |-------> +------+           PUD
>        +------+         | ptr0 |-------> +-----+
>                         | ptr1 |-        | ptr | -------> ...
>                         | ptr2 | \       | ptr |
>                         | ptr3 |  \        ...
>                           ...      \
>                                     \        PUD
>                                      +----> +-----+
>                                             | ptr | -------> ...
>                                             | ptr |
>                                               ...
> 
> Link: [1] https://lore.kernel.org/all/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org/
> Link: [2] https://lore.kernel.org/all/20251113014656.2605447-1-samuel.holland@sifive.com/
> Link: [3] https://lore.kernel.org/r/74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com

I applied all 21 patches to the declared base and built and booted the
kernels before and after on x86_64 and arm64 using virtme-ng.

Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

> 
> Patch History
> =============
> from RFC v3 to v1:
>   - Drop and rebase for CONFIG_X86_DIRECT_GBPAGES and use the Dave's
>     patch (https://lore.kernel.org/all/20260902194718.E1FF3041@davehans-spike.ostc.intel.com/)
>   - Link to RFC v3: https://lore.kernel.org/r/20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com
> 
> from RFC v2 to RFC v3:
>   - repasre commit message
>   - move ptdump_pgtable_first_level() into pgalloc.h
>   - skip the huge pud operation when CONFIG_X86_DIRECT_GBPAGES is disabled
>   - docuemtns compile-time folded page table
>   - drop the applied patch.
>   - Link to RFC v2: https://lore.kernel.org/all/20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com/
> 
> from RFC v1 to RFC v2:
>   - Restore slient fallback to next pXd in set_pXd() and pXd_pgtable()
>     and add check whether they're called with dummy entry.
>   - Add some comment for returning first entry of pgd in arm with
>     2 pgtable-level
>   - Link to RFC v1: https://lore.kernel.org/all/20260713135614.1618183-1-yeoreum.yun@arm.com/
> 
> ---
> Dave Hansen (1):
>       x86/mm: Introduce helper for checking direct map 1G page support
> 
> David Hildenbrand (Arm) (13):
>       ARM: mm: make nommu pgd_t a scalar
>       ARM: mm: make 2-level pgd_t a scalar
>       ARM: mm: remove custom pgdp_get()
>       LoongArch: mm: define pud_leaf() only when PUD exists
>       MIPS: mm: define pud_leaf() only when PUD exists
>       mm/pgtable: define (pgd|p4d|pud)_leaf() for folded page tables
>       mm/pgtable: define (pgd|p4d|pud)_offset_lockless() for folded page tables
>       openrisc/pgtable: drop __pmd_offset()
>       mm/pgtable: optimize pmdp_get() and friends for folded pagetable levels
>       mm/pgtable: catch abuse of folded dummy pgd_t/p4d_t/pud_t
>       mm/pgtable: disallow calling (pgd|p4d|pud)_page, pgd_page_vaddr() and (p4d|pud)_pgtable with dummy
>       mm/pgtable: disallow calling folded set_pgd/set_p4d/set_pud with dummy
>       Documentation: mm: clarify behaviour of compile-time folded page tables
> 
> Yeoreum Yun (7):
>       mm: vmscan: remove stack copy address of pud/pmd pass in walk_pud/pmd_range()
>       loongarch: kvm: remove stack copy address of pXd in pXd_offset()
>       riscv: kvm: remove stack copy address of pXd in pXd_offset()
>       riscv: mm: use proper set_pXd() for generic compile-time folded patable in vmalloc_fault()
>       mm/pgtable: redefine PGTABLE_LEVEL enum with ascend order from PGD
>       x86: mm: use pgtable_level enum in effective_prot_pXd()
>       x86: mm: carve out the generic compile-time folded pgtable case in effective_prot()
> 
>  Documentation/mm/page_tables.rst            | 84 +++++++++++++++++++++++++----
>  arch/arm/include/asm/page-nommu.h           |  4 +-
>  arch/arm/include/asm/pgtable-2level-types.h | 20 +++++--
>  arch/arm/include/asm/pgtable.h              |  2 -
>  arch/arm64/include/asm/pgtable.h            | 23 --------
>  arch/loongarch/include/asm/pgtable.h        |  2 +
>  arch/loongarch/kvm/mmu.c                    | 20 ++++---
>  arch/mips/include/asm/pgtable.h             |  2 +
>  arch/openrisc/include/asm/pgtable.h         |  3 --
>  arch/riscv/kvm/mmu.c                        | 20 ++++---
>  arch/riscv/mm/fault.c                       | 52 +++++++++++-------
>  arch/x86/include/asm/pgtable.h              | 14 +++++
>  arch/x86/kernel/cpu/common.c                |  2 +-
>  arch/x86/kernel/machine_kexec_64.c          |  2 +-
>  arch/x86/mm/dump_pagetables.c               | 18 ++++---
>  arch/x86/mm/init.c                          |  2 +-
>  arch/x86/mm/pat/set_memory.c                |  6 +--
>  include/asm-generic/pgtable-nop4d.h         | 54 +++++++++++++++----
>  include/asm-generic/pgtable-nopmd.h         | 54 +++++++++++++++----
>  include/asm-generic/pgtable-nopud.h         | 56 +++++++++++++++----
>  include/linux/pgtable.h                     | 69 +++++++++++++++++-------
>  mm/vmscan.c                                 |  4 +-
>  22 files changed, 371 insertions(+), 142 deletions(-)
> ---
> base-commit: 8d61431ed2607386b427752505379536eb634ce8
> change-id: 20260722-dummy_ptxp3-3741d78cc70f
> 
> Best regards,


-- 
Thanks,
Usama

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
