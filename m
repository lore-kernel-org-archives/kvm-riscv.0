Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA939C4450B
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kV60CbGTwZlbVzMvtGt+gs3G003/1F3GemrWeuNm0MY=; b=BOjOCco2GFwMSX
	yucVd0wLXy3Oz7klRt86h05seFJkqrH3JgDFEe5YWBU6LPuy2v62N5umqgSOsdISkHeFJ/ZGnhtQp
	VCXbVjyUvYxZjj9CGLCpTjwzm30yZSwVSdtr5f7OuJe2tgYpQioY/we/duoIqzxGRlFQd9v2gZaad
	7xZaMEMb1guZsYvKzc8ghT7W7sGgTeNOtYXhXHjnpual5wWLlT0tB8TgsAThdOG35P66YLgmB8F1e
	jcDZ0dFiDXqyXReticfm4po2TZIa8htZadEvfv3Bg1XC7otirsD96JOovwmpRUn6dU2dXTHk8poi8
	lZbw5cWkrbMoL0YXiYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhsX-0000000Csqa-1GP9;
	Tue, 14 Jul 2026 18:29:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhsU-0000000Csq9-3h7Y;
	Tue, 14 Jul 2026 18:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CECC5339;
	Tue, 14 Jul 2026 11:29:04 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B86773F7D8;
	Tue, 14 Jul 2026 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784053749; bh=Q1RaqZFJWDyzCpzM1YydwuIkdx6+prWZv8uRlRqjdPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qQBkYOYvll6kV7ChEqyEs9q4KbHl0/kv64+7ai5nhYymyDIN8BvOvG1HzfhI1sCcI
	 qnEtCqga3FrW8+7FXBrXN5emMU1ez24iSDr20rEKRSLvtMZ9oCz/5VlGhBuCnHlKFi
	 ME8BD+bOTZVCgK3PWVNAk87A3Vsa2vT+e5mfIs0s=
Date: Tue, 14 Jul 2026 19:28:56 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Dave Hansen <dave.hansen@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux@armlinux.org.uk, akpm@linux-foundation.org,
	ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
	chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
	kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
	wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org,
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org,
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, hannes@cmpxchg.org, mhocko@kernel.org,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, kasong@tencent.com,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, ryabinin.a.a@gmail.com, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com, yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com, ardb@kernel.org, guoren@kernel.org,
	yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
	dinguyen@kernel.org, schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech,
	muchun.song@linux.dev, vishal.moola@gmail.com, namcao@linutronix.de,
	pavel@kernel.org, djbw@kernel.org, yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
	coxu@redhat.com, andreas@gaisler.com, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
Message-ID: <alZ_6HFc56zC7tt0@e129823.arm.com>
References: <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com>
 <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com>
 <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com>
 <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com>
 <2d51a1ad-85be-46bf-ac36-18eca199b449@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d51a1ad-85be-46bf-ac36-18eca199b449@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_112911_048700_8E507FF8 
X-CRM114-Status: GOOD (  17.33  )
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

On Tue, Jul 14, 2026 at 06:31:22PM +0200, David Hildenbrand (Arm) wrote:
> 
> >> This makes a *ton* of sense in effective_prot() especially. Its entire
> >> job is mirroring the hardware's job of inheriting permissions from
> >> higher levels of the page tables and enforcing them on lower level leaf
> >> entries. If a higher level is folded, there's nothing to inherit.
> >>
> >> I also think it's worth taking a brief pause on the coding to think
> >> about what kind of design would actually be nice here. If the design
> >> really is that the pgd is folded, the 'struct mm_walk_ops' code would
> >> ideally not even call ->pgd_entry(). It would just (for example) *start*
> >> at ->pud_entry() for a 3-level hardware page table.
> >>
> >> If there are no pgds, why bother calling ->pgd_entry()? It couldn't be
> >> done transparently to mm_walk users of course but it could be done
> >> incrementally where users move one at a time over to a new scheme.
> > 
> > Agree. Calling a pXd_entry() about folded one seems meaningless.
> > But seems enough to check mm_pXd_folded() before calling pXd_entry()
> > in each walk_pXd_range().
> 
> Needs some double-checking that callers can handle it (like effective_prot()
> would currently not), but certainly something to look into!

Most of mm_walk_ops *implicitly* handles the folded pgtable case
(e.x) pXd_none() / pXd_present() and other can handle explicitly in
its own handler.

But, IMHO, It would be better to skip calling pXd_entry() in the
walk_pXd_range() by checking the folded and this is clearer conceptually.

For this, it  requires the rewrite the walk_mm() where use only *p4d_entry()*
to gather the leaf/non-leaf information for MGLRU.

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
