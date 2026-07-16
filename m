Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E359C4450A
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcRCOVBUAEV8pUpRXE9DOU8ON+i+P5BtInaPUQFE2zg=; b=bmYOx3FoK5jmJl
	kAyC8qlQMpyktnTdkpbG7H47j/naBZog9cLN+CiKMh8J7EuG6rM68RMwVFkXCr2INrxSRP7IJxiXI
	II+VQy5IwexUx9zLO0qOV5gH1JrhaCvd4cDIRD5b6HZaV6zA4OELM6tadbR3lXhbGSyBtf3ExHX38
	700jPxNPDRpYf3veFYjYEHoC8OF//tI8aAUrCo//Y/KbW8btYayQoIabZSopsBhpDkbEuvRQUZ1rF
	nc73L5BaJaIQxYBWzP/PED9DD9ZiezOxCL9P8pAOmkkduIE78/RU5gDwHWtdsfE8y5WJIXDLEBijq
	XqRRhYMbmnTrQmXphjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJmI-0000000H4mJ-2cCi;
	Thu, 16 Jul 2026 10:57:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJmG-0000000H4lk-1eaV;
	Thu, 16 Jul 2026 10:57:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878791477;
	Thu, 16 Jul 2026 03:57:10 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 517673F7B4;
	Thu, 16 Jul 2026 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784199434; bh=183FD52geXzLnicj8PRvEsp/u5QGzLUNfdkFvdlvTLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5tkmkG5Kp9Oy0MkBeywkl/rzGCiym7zyN9Xb6/iGX41TcFOTCCI9eR7n1jDeY++C
	 MtXWXxwIyUA2P3b5+IQeTXGcW4DMtqA0RMDGfpR/q3XGIcPnKOXQYVi9AyUle/pECm
	 jJ4P3dTj7+rJAFitSQuPUx0nY/0/JxwJCdCuhuF4=
Date: Thu, 16 Jul 2026 11:56:58 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Klara Modin <klarasmodin@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"Kirill A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn,
	wangyuli@aosc.io, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Lorenzo Stoakes <ljs@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Rohan McLure <rmclure@linux.ibm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
	Anup Patel <anup@brainfault.org>, atish.patra@linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>, qi.zheng@linux.dev,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>, chaitanyas.prakash@arm.com,
	Ard Biesheuvel <ardb@kernel.org>, guoren <guoren@kernel.org>,
	yang.li85200@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	"schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech,
	Muchun Song <muchun.song@linux.dev>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Nam Cao <namcao@linutronix.de>, Pavel Machek <pavel@kernel.org>,
	djbw@kernel.org, yu-cheng.yu@intel.com,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Coiby Xu <coxu@redhat.com>, Andreas Larsson <andreas@gaisler.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stafford Horne <shorne@gmail.com>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <ali4-ibN7Jp9n22Q@e129823.arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com>
 <4a0f9161-961e-47f9-8672-9a06e52fefea@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a0f9161-961e-47f9-8672-9a06e52fefea@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_035716_546899_6A9260D9 
X-CRM114-Status: GOOD (  12.42  )
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

Hi,

> On Mon, Jul 13, 2026, at 15:55, Yeoreum Yun wrote:
> 
> >  typedef pteval_t pte_t;
> >  typedef pmdval_t pmd_t;
> > -typedef pmdval_t pgd_t[2];
> > +typedef pgdval_t pgd_t;
> >  typedef pteval_t pgprot_t;
> > 
> 
> Just noticed one more issue here, I think this will break these
> two macros that now access four entries instead of two:
> 
> #define copy_pmd(pmdpd,pmdps)           \
>         do {                            \
>                 pmdpd[0] = pmdps[0];    \
>                 pmdpd[1] = pmdps[1];    \
>                 flush_pmd_entry(pmdpd); \
>         } while (0)
> 
> #define pmd_clear(pmdp)                 \
>         do {                            \
>                 pmdp[0] = __pmd(0);     \
>                 pmdp[1] = __pmd(0);     \
>                 clean_pmd_entry(pmdp);  \
>         } while (0)
> 
>     Arnd

I don't this this change wouldn't affect for this macros since
both of them still uses *pmd_t* which is u32.
So it still only changes tow entries.

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
