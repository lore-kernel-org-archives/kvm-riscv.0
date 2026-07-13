Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E878C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hox/TQewHIvPhvo1ExVSNwjxwXAZ4NjphDo1mODbMNk=; b=Mdwf0m9T7aTgkI
	T6vBucmCvwDF3lCUUeFTy1EcnMl6JbHsWlIHMYTRjK3cbbgwkhucxTzP83wI59sfsT5+aNTCbSh1L
	4G8UW0AIumh8JcVV3pencCCjUmZppuopcBcb4RF3nSX50St5NoO6fbLAK9cf2B2e3KFmpvMEPGT8Z
	B6W4x8m8tyRQdkH+a7qx0WgOcDv4p8RDz5N8mJ6q9zdg6OZGaYsJS3lO+1oOwSpr1ptNG7LxsjrG0
	jGStLnEm3BuXT6ExaNoWrXrOh6/yBXn1qHf5TmkDld6RbTptrvPKnUmIxYrH8S0YSQLWjhV5jHCzU
	f9DJD6v55hpXQpOKGi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHxn-00000009dlx-3Cx4;
	Mon, 13 Jul 2026 14:48:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHxm-00000009dlg-1J9J;
	Mon, 13 Jul 2026 14:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=04iSao5gDerJ9RePcs4t5FI7HrSYp8lGMn5u6CSIHfI=; b=Zhh+rGWlz8niB4zASwQA1Wl2CJ
	Vmj4xuBU/hYhsSxXDxm720+bnTcT6wzxoa8/mEIULddw/bFruI0XsjW6EB/b6mt8XhUjm6MgAHEX3
	4zL/Sw9th0YjLzUmGZqE5XO8pdRv1d7UnFLH0eY2uSWyVGY1j6cRW+EISvMQgMmruSZivamH5mV1B
	bY1cIjCFnpMzaCQkwVd8AWIdUemfehgRb+awhqc2a/3EBEA3V/oPhD2VCCfM/CsCx6R02EFDbFGjE
	fmvlAXmkimoq9afioZyAVYWNSVhbHCs2HzrdRZr9p4sUjMwPId950CB0yz0LM94Xy56sT5vrbw/kH
	dw6b/lag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHxi-0000000BjUb-35tT;
	Mon, 13 Jul 2026 14:48:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB5FF1576;
	Mon, 13 Jul 2026 07:48:44 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0AFD3F7B4;
	Mon, 13 Jul 2026 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783954129; bh=sDZ088P1ZnGXFHUryOiewAG1Z6y3h/p8Wo8FKkSXATk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/y2Lzj2tpSJ9ie2ChN90dBwkdVcdF6N1YWl/GHJ6Ed6GUsi5HGBqMbedj1YEbc20
	 2d0AjvCqu8dUuUImc6KK72I+VoeCy3EctyWNxpHamAG8FtdxwU0nxUzYtOesBuQc7P
	 5gq+kLEOBALggQXwz5Etf4nWUzIxrBp6483sr6C8=
Date: Mon, 13 Jul 2026 15:48:34 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, david@kernel.org,
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
Message-ID: <alT6wmSNDxL9S6rE@e129823.arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-11-yeoreum.yun@arm.com>
 <c3edfb13-08ec-419c-bc05-8f3f64186b24@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c3edfb13-08ec-419c-bc05-8f3f64186b24@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_154851_181771_2A187A0C 
X-CRM114-Status: GOOD (  24.48  )
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

On Mon, Jul 13, 2026 at 07:19:47AM -0700, Dave Hansen wrote:
> On 7/13/26 06:55, Yeoreum Yun wrote:
> > We want to change how pXdp_get() works with generic compile-time folded
> > page tables. To prepare for that, rework effective_prot() to ignore any
> > folded page tables entries, as it will unconditionally get called by
> > ptdump core with pXd_val(pXdp_get()), and we really should be ignoring
> > that value for folded entries.
> > 
> > For this, identify the first real page-table level and
> > update effective_prot only when the current entry is not folded.
> 
> Nit: could you please clean up the "we's" and move over to imperative
> voice for the series? We're picky about it on the x86 side, but I do
> think it's generally a good preferred practice across the kernel.

Okay... let us reparse in the next version.

> 
> Also I really do think this made the code worse. effective_prot() is a
> pretty tidy function. This change more than doubles the size and is also
> basically the same block copied and pasted twice.
> 
> Further, this does seem like it will stop filling out some of the
> st->prot_levels[] entries. That seems like it might break things. It
> definitely needs to be covered in the changelog.
> 
> So, in the end, I'm not 100% sure what this is doing. Is it "optimizing"
> the ptdump code? Or is it preemptively fixing code that will soon be
> throwing a compile error?

As a part of fixing code for chaning of pXdp_get() which can return
a dummy value for the folded table case since current pXdp_get() mostly
fallback to READ_ONCE(), it generates a meaningless code for it [1].

And this code change doesn't seems to miss anything since it skips
setting of st->prot_levels[] for "folded pagtable" only.
so It doesn't seem to break anything.

In the perspective of effective_prot() change only. this optimization
wouldn't be observed since it would be applied at the upper layer in
ptdump.c But I think this is required to handle a dummy entry properly.


Link: [1] https://lore.kernel.org/all/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org/

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
