Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B90BC4450A
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oB4iSbmf+8cui0wQSWEpvQ7ROCEREU6MmGL2CMHdzHI=; b=B7qAyg2d28fZwk8a1sfgIeA+py
	fZuHaT5qBIE2eTQQai03A7/pr0JSuyscAqDkm+fVI0RcdWVsggP2OqRa0rDlyN5KkVrxHxRQPgjuG
	+uRlbchAs1l/McI/6jPgfZ9Fu4D60wIMeXRwPQdLH8S92cKY0mMBo5VJ78WZVhhmcwyTr53BQ1Mhh
	6GMraR3Sh6sjlN/O7WurJDnSvKuLeJJyt/lRp3A4ktwaIiG3iNDL55Unm947yiZ/rjouUjmmPlWXh
	pZe53bqU86q2z4rNRQawzn5PI/u7nRHw/hLmQ+dseZ1Iw3M+Lr43xNdCwOq5SzgDYXWAsVowlY8X3
	hNh8682w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsqp-0000000DrGs-0oqZ;
	Wed, 15 Jul 2026 06:12:11 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsqm-0000000DrG3-1wEk;
	Wed, 15 Jul 2026 06:12:10 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id B2B0C1380119;
	Wed, 15 Jul 2026 02:12:04 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 02:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784095924;
	 x=1784103124; bh=EUNLiWQIu7iTIlSyfAVZR84DufWom2g2RocOGGt7G9c=; b=
	a8RAtuNHzJgQpRc7/V/O9hKgDUcjQuU4FAYwrHP9pWXQ1LGjnWdufjScf0CPwLXl
	ebuDD6/m8uMBMtjsmLyRxDwVm1W5D0UJ0qFrV0ql5UaaznPi/OAuQsTYCEfebhpp
	JHIhGETCVDZx0JCaK9T9XiGI+2yaxkBs8jBbV10wvybX7j6xe0sWdssCQibesp9r
	8ZMwvxPimz5JxUH87zSSHB/s3y19KyXU5yXlSf0yZzwka5szmKRHrUeXKTOPvbxu
	8UFr61JQoQs0kR0U0732WlMu3psRIJPB7il4skw3eB3PnoehddPNJJ7Z6aIeeXcJ
	ul6zn0HGzKLpoMSy/XjsvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784095924; x=
	1784103124; bh=EUNLiWQIu7iTIlSyfAVZR84DufWom2g2RocOGGt7G9c=; b=J
	r1iBAn+v7XqSR2sRD6G+XUnRGoxSwquZxwHfJPlKD5bUqHSELpk97BYD0EI7qYuB
	tWPI68KHKqboodxMu2iPmU+7Uedw5ij7bDSpzusWe1PzwiizuSoR7PsPJkwFOAQr
	7TPp2tbWpukaZ8XIir6cdpKNlalTJRq9E4cNzSIIAGTgF6mrZH25az8g3Hd2T4NB
	azOIXT0CQfO2WJ/tJg/fW7aTy/7uAKCIs9WoNMGmYLB1hshS6J5WksM8AcR43gHn
	Snwxa1Y/HFo9DknVQUJNoJ9eaM7isTSaAOA9nPwbhGSy8SQYoHrXcnJDBDL/x/Yy
	PUj7y749VmENuoYCyqf4w==
X-ME-Sender: <xms:ryRXamxegDT7PDmJNNPgLswItiV1L0wADqQ55UdRMZ1ltF3sBg21_w>
    <xme:ryRXatEPnD47JuD9gtMrdA80Zx5AuYb_KJjzokHu0vEJRORd3VW5eC0IF6w3LN35z
    51IafVJylssdT0E2yYiYe0hVEKysEzyz3cHKOnAoA9mfqtNj47zCyiI>
X-ME-Proxy-Cause: dmFkZTGFJUT9q0RQslH+2LbGJNpjb93/J6MhXke5wQ0bwjzy+neOq13hjf56wjlruzpSKf
    YmQ8WX1FNCCuKclqu4rBYjdK+D9Fgwgeg5Cv9tvMeiYLsueu8zGPzHHzgdW8nhVvRSu7sd
    Adqa+XD8nn68rTK01FmplsUZnMHbxOBRt/Onegc1p4/ensfrizVXWshbh6naWEPhzyQb/h
    ZU3V0wHuBvzTGhcjIY7HBhH4r1pbDyidwblxIuDazjX/A64isrjWWp33IvQYz2XBSkFm2z
    vXCH/0NzPAchHQOC4XNZPKm1lTi0avCvBxltVxR8oZ5vaE5uQ/r8uxDe6hFyc5XAHHPMP1
    Ca3gLCSlhDaJMXMB/cNV90FOM/5FsDVccx+UMiFyGSSOCZH1gLSBoeRsW+OB8cS8yHkX9P
    0oxzCUds8E++pvQSsElVI1d6rJw7dSCHBSo1I+Ra1KDy2P7SgXUbS1AsPzIUBbxY8XxaDX
    rJt/bMPTYoQte8pVgPCNmTjaADKFnid+D+Hi9XFCuMQdsX8uYEx6JY/ru3lwl4mxF/21O4
    1LJGVV+PHrWsBtp6R6m3VX9gyDeiH/sJW2YGARSv6w1T0Vp3iqzKE58cKA467FvKs/R1MT
    QFAnYmCsN4PVXVZLmJvc0YtS1dw86/rcfWf9MV22qTW9UKDOpN9kexkBYKKQ
X-ME-Proxy: <xmx:sCRXahm_eEKhKv0bT_bm3ckpgyWzIY0tMOn02kO6iYQkbS1lslkAHg>
    <xmx:sCRXaqizgUvqruPJ3B5irYcNhpEnpTDlGmnQKfe63XHaekM5e1IlaQ>
    <xmx:sCRXavtVEWvBAmUP25RuhVS1F5dVNlz5NZeNWYAatfQ0I-E2bXxEDQ>
    <xmx:sCRXap8AdlLW1OLuSsMNrFn9w4kjhfhTG_k4v-qvGOs35ggJ6BXMJw>
    <xmx:tCRXanaMRI-1Cl0xSo1dwVai7gVVaK0YQWMAziD5wV1tzfGL7RowtiwY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DA915182007E; Wed, 15 Jul 2026 02:11:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Wed, 15 Jul 2026 08:11:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "Mike Rapoport" <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Klara Modin" <klarasmodin@gmail.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Kirill A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Tejun Heo" <tj@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Anup Patel" <anup@brainfault.org>, atish.patra@linux.dev,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>,
 "Michal Hocko" <mhocko@kernel.org>, qi.zheng@linux.dev,
 "Shakeel Butt" <shakeel.butt@linux.dev>,
 "Kairui Song" <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>,
 "Axel Rasmussen" <axelrasmussen@google.com>,
 "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>,
 "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>,
 "Dmitry Vyukov" <dvyukov@google.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Yang Shi" <yang@os.amperecomputing.com>, chaitanyas.prakash@arm.com,
 "Ard Biesheuvel" <ardb@kernel.org>, guoren <guoren@kernel.org>,
 yang.li85200@gmail.com, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech,
 "Muchun Song" <muchun.song@linux.dev>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 "Nam Cao" <namcao@linutronix.de>, "Pavel Machek" <pavel@kernel.org>,
 djbw@kernel.org, yu-cheng.yu@intel.com,
 "Baolu Lu" <baolu.lu@linux.intel.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Coiby Xu" <coxu@redhat.com>, "Andreas Larsson" <andreas@gaisler.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>
Message-Id: <d0b34b90-fb12-4579-a965-ea5b90284f18@app.fastmail.com>
In-Reply-To: <20260714224553.583c8445@pumpkin>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com> <alYL7B0HAvmLVHGU@pedro-suse>
 <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
 <20260714143450.61a94085@pumpkin>
 <aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
 <20260714224553.583c8445@pumpkin>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_231208_707536_5A57488D 
X-CRM114-Status: GOOD (  14.56  )
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

On Tue, Jul 14, 2026, at 23:45, David Laight wrote:
> On Tue, 14 Jul 2026 17:06:00 +0200
> "Arnd Bergmann" <arnd@arndb.de> wrote:
> > For the 2-level page table, this only concerns pgd_t, which is
> > rarely passed around or returned by value. The 3-level page
> > table has a 64-bit pte_t, which means we probably won't
> > want STRICT_MM_TYPECHECKS there.
>
> Is the 64bit pte_t needed to get the extra modified and accessed
> flags there aren't free bits for in the hardware pte?
> Would it have been possible to use bits that are fixed in the hardware
> pte for the extra bits and write the value to pte[0] and pte[256] fixing
> up the value written to pte[0] (that the hardware reads).

The 64-bit pte_t for 3-level tables (armv7ve/lpae) is the hardware
table entry, following the same format as arm64, and similar to
how x86/pae works.

The special cases with double pmd_t entries four 1024 byte tables to
hold hardware and software entries that David Hildenbrand cited
is only for the old 2-level tables (armv3 through armv7-a).
The Linux pte_t is only 32-bit wide here, and gets copied into
the CPU specific hardware pte in the cpu_*_set_pte_ext() function.

    Arnd

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
