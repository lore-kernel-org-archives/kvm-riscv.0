Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B81AC44536
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpg/f28Vo6jqduTSCxrslbkk7wjEaakyKBlkOKZKjT8=; b=PzpDzbLSeRT/VH
	UCY1ZIXATYRcbbWDLhf0jgP/wC9BO4p6U4bnWV8z5RG42IU7Oal4bCc6H7raDdn2MIrRBLTywsTbK
	fUcxv12yRXFk6RE7O9vUEW1k+EAEpQStgoW5M72aITlhyqp0PgRMyMeWlkyGP+dBLS7XbVYjwEj83
	4N4deCdri9J10XdEb2dAO8Db/D+DMmi2noqd+ez+xwN105dd/ceEZHaeTVnqXXKvvYb/lsSddvHja
	9aVUTKgMjJgPfaJai4dFWKhk2fV7mTNOC8fOMQZAIaIbiNbs883qn3xcaAxIjGLI1LAhJnIHHsP1K
	sTtus5o+BV2KiYvJyYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdkO-0000000CkX8-1EfB;
	Wed, 22 Jul 2026 20:40:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdkL-0000000CkWa-2k1u;
	Wed, 22 Jul 2026 20:40:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A41A51595;
	Wed, 22 Jul 2026 13:40:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AED0A3F59E;
	Wed, 22 Jul 2026 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784752851; bh=MW7m2jjynF2iry9O2w1L4Qc+wiQ9bjVZq6XG6lr4jCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u905XyTg55ekAxzZmoFPwtPfxi5ZSTHzMYONIJRUH3y3Fm3Ceef193xeIS/KNVet8
	 yxQtUrz5r9bnDKhbmP7Q6WsDlqh8n+se4+8VEFwxrwJi+9h/I/UO3XVjm15kHRCI43
	 GxZw79GmfpaXJMh5WlC6vJc6NU4kBvXcntwV3zC8=
Date: Wed, 22 Jul 2026 21:40:42 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RFC v2 14/20] x86: mm: skip pud setup when using generic
 compile-time folded pagetable
Message-ID: <amEqyjdoUnD5lYev@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
 <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com>
 <amD7ab_KuJPdBQBh@e129823.arm.com>
 <6f5060a7-0a64-49fc-81a3-ae88729ef794@intel.com>
 <amElnEbvRTjv2hyU@e129823.arm.com>
 <3620750c-54d7-45a0-b067-bc813dd3cd9b@intel.com>
 <1064CF47-9371-4D9C-B2AD-1457CA41CDB2@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1064CF47-9371-4D9C-B2AD-1457CA41CDB2@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_134053_922648_C58201C3 
X-CRM114-Status: GOOD (  15.08  )
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

On Wed, Jul 22, 2026 at 01:28:40PM -0700, H. Peter Anvin wrote:
> On July 22, 2026 1:22:04 PM PDT, Dave Hansen <dave.hansen@intel.com> wrote:
> >On 7/22/26 13:18, Yeoreum Yun wrote:
> >> Sorry. But do you mean check with cpu_feature_enabled() not with
> >> boot_cpu_has()?
> >> IIRC, the boot_cpu_has() doesn't use the DISABLE_MASK_BIT_SET() but
> >> uses REQUIRED_MASK_BIT_SET() and I don't expect it wouldn't make
> >> an optimisation to constant check which is contrast to DISABLE_MASK_BIT_SET().
> >
> >Ahh, yes. I forgot about that nuance! Moving to cpu_feature_enabled()
> >would be great!
> 
> It is supposed to. That's the point of the required mask.

Sorry, IIUC if the X86_DIRECT_GBPAGES is not enabled, it would fallback
to test_cpu_cap() which wouldn't be optimised at compile time IIUC.
So It would be better to use cpu_feature_enabled().

Am I missing something?

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
