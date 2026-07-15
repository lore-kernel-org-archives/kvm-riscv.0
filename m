Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99129C44501
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Je8G/9dh9NcSgAnustv18PTq1mmnq5kk/BOtDd7ZEk=; b=aad8HjfXqDWFib
	A47Hqzf3sdzjMaJWpEfHCpWO+4FhYWBY57PbOveqvQvOV20+HS/CuRcfa4FQtbJbrQGKJ5fPHVEuS
	yQTzeXPymRmjqtB6aV+Kp3TJaL8E741YuQvzA0zHHkS/UwGQmFyaA0DWcWNlRPv4NBenvCFq5qr57
	e6kkkTRZj7A5/WnwfIhruXuOCNfdsjTgVAJUOP5W097sq2eUTeSGUKnfnyq2GRFFUwg2SvbmuFB+0
	SoFGkCAZmc+DBThj42GqS9HowdTCCFLOknfq/oYx9XO4cmnR2xV6ySMBDKB6Qq9ZHfapFBCRvA+vm
	Y77soR8BmM9zU1ptU8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzuW-0000000Eyo1-0wze;
	Wed, 15 Jul 2026 13:44:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzuU-0000000EynT-1oXW;
	Wed, 15 Jul 2026 13:44:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC4D31477;
	Wed, 15 Jul 2026 06:44:18 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51C63F915;
	Wed, 15 Jul 2026 06:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784123063; bh=eIgpCTRPgqPTqdx54P+55ycRFoiVAMVPyrH/hSOkxIw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=XUDBCE9uKhapcjpn3hEyydo6n8Z10XJL4DGb4h958hMrkQQ51e4U0TkwAjNzJDzOk
	 eD/LOzYvppL+1IQtFhflB4XCT6Ncvq4/Hh0/F3eNv5PwdHMKH6kHWKs0fpugu38REX
	 eGLtl9O5j7jNXOw9fMgYIdBX0uaZplN8x21Nq5zc=
Message-ID: <1dcd93fa-4922-433b-9f1d-c096c0de3665@arm.com>
Date: Wed, 15 Jul 2026 14:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, david@kernel.org, linux@armlinux.org.uk,
 akpm@linux-foundation.org, ankur.a.arora@oracle.com, rppt@kernel.org,
 linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com,
 chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org,
 zhangtianyang@loongson.cn, wangyuli@aosc.io, tsbogend@alpha.franken.de,
 ljs@kernel.org, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com,
 rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org,
 kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org,
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org,
 guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
 dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev,
 vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org,
 djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com,
 Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com,
 liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
 geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 11/34] mm: vmscan: remove stack copy address of pud
 pass in wallk_pud_range()
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-12-yeoreum.yun@arm.com>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260713135614.1618183-12-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_064426_716122_3BFE0755 
X-CRM114-Status: GOOD (  15.77  )
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

On 13/07/2026 2:55 pm, Yeoreum Yun wrote:
> We want to change how pXdp_get() works with generic compile-time folded
> page tables. To prepare for that, replace passing the address of a stack
> copy of a pXd to walk_pmd_range() with pud pointer directly so that
> the ignoring the value of folded entries.
> 
> There should be no functional change.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 986dde8e7429f..61470223d8213 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3725,7 +3725,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
>  		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
>  			continue;
>  
> -		walk_pmd_range(&val, addr, next, args);
> +		walk_pmd_range(pud + i, addr, next, args);
While I was working on converting these page table types to hardware types, I
had this exact patch for this problem.

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>

>  
>  		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
>  			end = (addr | ~PUD_MASK) + 1;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
