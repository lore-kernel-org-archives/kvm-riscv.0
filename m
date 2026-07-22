Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC91C4453A
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBkNLCAwQmejGr2Fa7wDJu/MiL9T38prQHx8l5IwCBM=; b=3p/UcBEeYcnwDA
	GSzNwG0tWtVZAEyWa7S9IJ04g1iBHU6QCMRYWORkFnvCfdZLHKBYeQiUBxoBbzX8X0Lnkxb2HfD5X
	HQ14ZSoGZZ+vo958vpXJOw+IacA2BdxnOEsfOGm+ndvfUctwxp5FGDgQLvduY1x/ZYUkc83MM2wzz
	xVyHrpPiBOTQ0IJcz9WS7wJeTiIAuIlIgTRX9l0EFIJyXkHkgdaare+vmOg9txgwL5HOiGBVrG6o9
	q108EZxZ+gHz3H+hyeXEfq2/54vun8nco+DDb4dTMX/UGoc8qYUZ5OCSf04LnM/o1bI9XRYVYiNz5
	XZXrFukRDEjNtGoqJpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdZl-0000000CjCZ-2PgK;
	Wed, 22 Jul 2026 20:29:57 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdZi-0000000CjBt-2xo0;
	Wed, 22 Jul 2026 20:29:55 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66MKSjqC1278121
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 22 Jul 2026 13:28:45 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66MKSjqC1278121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784752128;
	bh=HZenVVn2FbCkGx5eN7DH3cc/7/vouTK11eR/A2iTBKg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mW/pv4H7D68XMTeHNm3fkahmI1TOoQEIJW+FwVE9P9RGRCZMU1yzbf00780LWbIf5
	 lMWCsDDWgkZ3mQzVdUbc+FUFxB7JHa3IfHG5IbCuO8SZA6RTlV+u0eNfDswjtkOwJJ
	 Y2hRrVSp1jdcROOVerDK5arOVeJfRBuUCw2mWnH5UEIVqM4Sfocn/bTEIR/tUd1smD
	 Zaxm0lLCm7G7q63HYdxg5RWgzqqc51+h+OCNW7g0YR4tmW0S5bxHte7PAw5QRC4Ie0
	 FNPgy+3wnQSj+WodmlD6kmUH+2AJq2gPFIl3XR7z52JBDBgAbc8SIQ4cGUTO4UriAI
	 ZJk0nTNhjK4sQ==
Date: Wed, 22 Jul 2026 13:28:40 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>
CC: Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-openrisc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_v2_14/20=5D_x86=3A_mm=3A_skip_pud_setup?=
 =?US-ASCII?Q?_when_using_generic_compile-time_folded_pagetable?=
User-Agent: K-9 Mail for Android
In-Reply-To: <3620750c-54d7-45a0-b067-bc813dd3cd9b@intel.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com> <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com> <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com> <amD7ab_KuJPdBQBh@e129823.arm.com> <6f5060a7-0a64-49fc-81a3-ae88729ef794@intel.com> <amElnEbvRTjv2hyU@e129823.arm.com> <3620750c-54d7-45a0-b067-bc813dd3cd9b@intel.com>
Message-ID: <1064CF47-9371-4D9C-B2AD-1457CA41CDB2@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_132954_747541_AB6706E2 
X-CRM114-Status: UNSURE (   9.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On July 22, 2026 1:22:04 PM PDT, Dave Hansen <dave.hansen@intel.com> wrote:
>On 7/22/26 13:18, Yeoreum Yun wrote:
>> Sorry. But do you mean check with cpu_feature_enabled() not with
>> boot_cpu_has()?
>> IIRC, the boot_cpu_has() doesn't use the DISABLE_MASK_BIT_SET() but
>> uses REQUIRED_MASK_BIT_SET() and I don't expect it wouldn't make
>> an optimisation to constant check which is contrast to DISABLE_MASK_BIT_SET().
>
>Ahh, yes. I forgot about that nuance! Moving to cpu_feature_enabled()
>would be great!

It is supposed to. That's the point of the required mask.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
