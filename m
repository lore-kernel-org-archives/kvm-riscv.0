Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE38C44501
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jDqpFUOceHbdeoy1FG1Yvb0VvnVe/iRRTWU4JINQpro=; b=bA1M/9Z+zx12mP0kJIn/HERLz4
	RBuFS+URHL+6y4sGOTIlcJKm84/EelGFGJRQK12FMKCNNmoR24MHDMVbL43vUyMcIAKM+tJjtKqcM
	REGEZJrW1Z4duSk2ynKyV9Uzg1J2FRMJ6/bW9iuIZOS2wWi8qR3NrneO+fqRVBuZNhCSsmEL99tes
	oCg0m6x2mtZp5iYrllgEuoOvi/tidDYxP8hNKKeV7Ks/F4oRdnPiJ+pDNLlX/B47kLx7twVaG3SEH
	uDRTIKaiEf1LS1dgRov7j1tnXIH0nCxkZOyzFr9VaT9e0lxAK3LQephO1UNnJZJVWMx3OKSwVInRF
	yKRr1aTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbjp-0000000BoRT-2OwU;
	Tue, 14 Jul 2026 11:55:49 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbjm-0000000BoQj-1Qe0;
	Tue, 14 Jul 2026 11:55:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id EC16A130018B;
	Tue, 14 Jul 2026 07:55:43 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 07:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784030143;
	 x=1784037343; bh=T+24MjkKOyccdIXKr6nivOOwP9jmSIAod++JgzQuHBc=; b=
	CVv3c2hhp8uDNc5r7ko2QUEtAAEx6nH7+CrFdGshtB/9AFtkXsk+/qw3yHVkZex3
	Vu2pyZGe7H8X64Mc5ca+WSXsO7bWC9O09NZdEmA7HZE7eZ85HM3/1zLXggvYdeuM
	16qF02oA9jL+4y2fpX6uD2YZuMPLGt0nMGRyEVu6f9MeJYOE+aR6E1lpqUGQowZ1
	KP9Yq4MFqjRpWhYQBq12QjfuhTqbRZiaiTTMwnONYQKH0y2vq/r/elX57A31FF6N
	1W3e3QWu1DoyiVFQBGIkueMbUdAh2ZnUSSYsL5UDCpUp3AC/zE/RYCulDhbLOw7k
	+uFvtuEOSR+bhu2NrvK7aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784030143; x=
	1784037343; bh=T+24MjkKOyccdIXKr6nivOOwP9jmSIAod++JgzQuHBc=; b=f
	NsAiUF2wwNHbm2aRh2VZvJga/CUIwB0EAlWxBskMLODdHCILE6vnzOvR83AnOzQl
	C8hVCO4GyTMsu7FBrFxQGuSWPsKy3FSWOq1c+xUKsYqBv4uEqrRFB3gayLttIqS2
	u83K4SQN9y/BFFYAKEW6yjopRJxx9hQlgxhLko+W03RWXrYA4yXKm7O2ajDzwFFM
	e83tcetVh9XkdyXTnKRy2e8TO+K900r4hcchIyI+CPCM7XZqPq1GFTEy7UE4lIR0
	J7HVETXUGSGEAo0czc6ylx+mDLI8TqprfL9KLguzXthnTGD0UsguRyqtmSV0VkT6
	6aVmY5FL81d4cieO9JZ6A==
X-ME-Sender: <xms:uyNWalt8ukQBwYv6Gt7VUExfITQvBsstUE5RUTrzK0Gvq159mQn17w>
    <xme:uyNWapSIkzhd8c-ahrxBAFufEnZo3Sne1Fl2cbjrg2ZN3Lccmh6C_o3P-DfGDFxUn
    sIg0pYngkjQSeMNgV0UWSAbmfoOFhIz3T9S5pIE2SX34C6jv1pjP8tw>
X-ME-Proxy-Cause: dmFkZTGxIX4qsR7V9UOAbbpZ7DI+TPioS3EdeOfkz2sqQrWFwCwBFa2jO13xOhfwAzebyL
    vDn4L3EOcKqRhgsBPy8K0LlhasC87RLvJKakFM63Ex5ajF1mW9HBfU9h64M01z8Zkd1enj
    GGlJ+S1uE0LE0ntEkqcD2W8Mc7+iLE1JAn9qBp8jOSHfQ/492DuvwwXjB3rPP8pj/tMaxq
    q5TAvzCpGhJ8fPEa4+CYMo9P46KZqjk/ruzcYSl9IYoSn7a13f67wJC/dG+TgSpdxoToXo
    rHMhANm1HxqVijJlmPefX4wiI6JZN4Z55MCfIh8k55OoUatB+dk0XUuzpv91MEhl04VWsV
    ZSok8TCuuKj8PWwP0EiIT6QCPzE9Rhj+56/WVYSuoFKN5pnvjixLDWFi+WaLep3dlBF/ZM
    R1gPJomvZP0vI1mZd2xbHjHC4PbZoDJZaTI2Ff/jkCigkrwZtlj8DSAfGjPYx0nC29U3Zy
    hDEvNQoI0Xi+DgnJGdxCmodO1+oDmF5qjsBDd7dKYUF5QBBYz+zfMf4uhbEhlzoLTu8U5r
    m8QjPMKAYeAQelZO7q1lnl3i66zJ6sB+Q3LY9jh3ODNPd2SBRx29u7BvyOPJFOnGnIoKbW
    izEG2Rtu653VGFVorcXYXHnVQAnHtxZF9aSmlvX/LNWUy3QkWR/KwJPtp2hw
X-ME-Proxy: <xmx:uyNWaqzCG7oLkHgr2707HaSDbalGogtx1FIQpREY7NUn4k5I1vhZog>
    <xmx:uyNWagdqLr2-T4dQLiEGj2x5Ja7MmcDpQ9saR64VrBglZHa2LLs_GQ>
    <xmx:uyNWag-NW5lmoFjivEHv2jK6SIAsug9P0F140RFyfmM4dUQcWFnN4A>
    <xmx:uyNWahES6J1uBUFym_4ngGCm93iVp4JHd694IJ2fGtylDwcLXlD07w>
    <xmx:vyNWaurTTdPA3xEUOXdW4cewVvGt51MQOAWINakqJRR53uGyaCedkGEK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 57A521820082; Tue, 14 Jul 2026 07:55:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Tue, 14 Jul 2026 13:55:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Message-Id: <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
In-Reply-To: <alYL7B0HAvmLVHGU@pedro-suse>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com> <alYL7B0HAvmLVHGU@pedro-suse>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045546_645131_C44993A5 
X-CRM114-Status: GOOD (  21.18  )
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

On Tue, Jul 14, 2026, at 12:26, Pedro Falcato wrote:
> On Mon, Jul 13, 2026 at 02:55:41PM +0100, Yeoreum Yun wrote:
>> From: "David Hildenbrand (Arm)" <david@kernel.org>
>> 
>> We don't want pgd_t to be an array, as it prohibits returning it from a
>> function, like pgdp_get().
>> 
>> So let's just use an u64, and extract the right 32bit value in
>> pgd_val().
>> 
>> Leave the STRICT_MM_TYPECHECKS case alone for now.
>
> I have to ask: is there a good reason for the STRICT_MM_TYPECHECKS ifdef?
>
> I see the compiler has an awkward time returning a u64 struct (see
> https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> purposefully toggling it on for testing from time to time.

As far as I can tell, the #ifdef was originally in i386 and
got copied to all other architectures at the time, but was
removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
was introduced.

For some reason, only sparc32 and arm32 still use the non-strict
version, with arm having changed from the struct version in 2002:

https://github.com/tbodt/linux-history/commit/5a8202f0259a
https://archive.armlinux.org.uk/lurker/message/20020306.213958.cd486eeb.en.html

> If STRICT_MM_TYPEDEFS's worse codegen doesn't matter then maybe we should
> permanently toggle it on.

This would definitely need good testing. It's possible that it's
not that bad on modern EABI builds (i.e. everyone these days) as
well as modern compilers, as OABI definitely had bigger problems
with 64-bit arguments.

>> +static inline pmdval_t pgd_val(pgd_t pgd)
>> +{
>> +	return (*(pmdval_t (*)[2])&pgd)[0];
>
> Ugh. This isn't correct C code. It only works because the kernel passes
> -fno-strict-aliasing.

I think the bigger problem is the code dereferencing the pgd
pointer in the first place: Since the pgd pair is written in
32-bit units in __pmd_populate(), anything reading it would
technically have to operate on both entries.

As the kernel relies on -fno-strict-aliasing, the type mismatch
is less of a problem than actually doing the potentially wrong
thing.

As far as I can tell, we are however saved by pgd_val()
only ever being used for debug prints, where printing
the first entry is likely all that is needed to analyse
the real bug.

> I would recommend either forcing a struct here, or
> using a u64 with bitmasks/shifts.

That would require extra complexity for the big-endian
case though.

    Arnd

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
