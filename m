Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FA1C44507
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 21:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVTS/WU4K340lXmvnnEIHqvZzfFg5A94EAO5+xiAB4w=; b=yVTKVHsLN3h2AO
	SrcJ/qIq7saGGi6SLpLIrutBPNYE9wVxP9WuQ7nPAi9kreWypTpyIiiXl/LWwAHBlNnKlgYrPnmQN
	hREFz9S54cjU26qAnOcHty0PAvptakXL10gYbmKoUApDkAhV2W1iUXVTipjLkM8rFVPMKX1mZ0f+H
	lHeqhRtzqLUshIAgzugwKU9bel3/gI9z+OrgWJsnkibQw13WDlW8rGtlcfqtNN88gKx+T0sskxvMl
	0lq8JmGatlS3gXdxwmemYznJOiywD6XedKkdJlFR9kgpQz7dOdgjDxetYGFviuAzFlZSyscLBumTl
	q2VJWBye3aFup/MVYzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkx1-0000000DMy3-1wCN;
	Tue, 14 Jul 2026 21:46:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkwx-0000000DMwj-01DS
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 21:46:01 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so19476995e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784065556; x=1784670356; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsgDUhCPZi1cUpPkNQ/I7/JmqQLLDAJpIhlyKeHE0tE=;
        b=jtV2R1AacnsHVbnVhm93NemXFlZ9HFpZLME3M9D+I31h6Fux+613Z9YhvfCxLNhd/K
         9G4qE2WcoQr0a+rgwn2zvZZgYwS5hYsxKvzKTeWQ9dINzDsU6GiP1pmX1xbRmPOPThbc
         78TB9eXQs1d0ShHwPHiNM/mG5AGPcWYYbZQyzfRXEq/eWZk8hrcP2/YRWbjg8bSg/Roo
         BZk5NA7yobwRNmBCp5vRcsEEBRjxGZqAWm6YCwjCwJwl49zpA8/jPxsVNvBhVkAgWGeW
         PI5woReZbB7vRffz8pmLdWEVmRmQ1QN8QerWjRRYVrkphgmAunZ8dCz8kio22EMIlmG4
         HHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784065556; x=1784670356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsgDUhCPZi1cUpPkNQ/I7/JmqQLLDAJpIhlyKeHE0tE=;
        b=ofLcbcB4ObcWM8h/3BNHP0h8qPS9Ygo8Wl09u86khT4ybdV+5CG2C/F9fqz3P0lhFp
         fQEHSJmszodRoIIXD08QyJaLXl1TTbotJpKw12gpdRfTN7MR/Btk197haT8rTTIS4QeV
         SchE1CxMhfOuGTbG0RJL/YjdRdu5mfLzOdZz8K/xfraObeTY7+PHmowTcO2yt/BuWxzp
         6BPuaYaeSMvPEpfL7rMZEaYQPFGppIZ+yz2RTvyOx2ZzYaCgeeL2KqVYbJmIBXQJAl9q
         9VXkJs/ZVhQVMt0ITZ7V5N/4Xf0q7Dy10PfyIBmRvDyIJaejAvu6L3fm5MnZVFHBm9fz
         FNvg==
X-Forwarded-Encrypted: i=1; AHgh+RrPmAdDQwIgfdse58Z7EJJNZasm58sMO2rGhbZD+zETpZ4MZquAh62R+n/Vc6kzQ7nUFqhxi/g4lF4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwisJnwqHWJeW1U1s7NhFHkOZs9kIkJ3m8v5D85rufb3Rb5qrju
	zIuk7I+K897ZB6IKGaHR80gLZjDsm1Ehs7wucCHUtJgxN20kugYPcFgZ
X-Gm-Gg: AfdE7ckJTWPLYJlO8v7gRvjH8NRofGfBjeOHPDC+e6ivmjglXPds2doigZiqBX1JMyD
	EscW9z0kzcIjHaVRa1fU/9BDcGZg+uIKkaGRw3oSZMeuaPUAJgSo8/oFasjlXDWMZcsXfeX+TFE
	EN0g2OHaKOKYSnszgDKFUG/z4t03sqtPKECPFEoNuFSMGvaYpLRbbnWxn4McmpsYDiRzX7txBwR
	U4/pIZtOmfu63Y57EhKZdBvmfKJqNhkhv4R5z5HB5oYIEVRs7MT+43yp10xq4ytJoxCErNZXw2l
	wBhrJdWqJJs3IEmLo/NkIYLUDgJn6RBIRwvrxuRx7XcjhgehFAJacveKhyEmq7/9frcP70YIVuf
	eD3DrdZKVX1+cxSoon08mo97QObFaQ7WKI5uWNtPeUuXcX0uf7QU+me2X32fqMaC/ArzQfkA3Oo
	w5/aVSu6yzOMzqERRqoMbkXQ0F6kpzWq+8BbmekB2YSfvmHOJ1yQ==
X-Received: by 2002:a05:600c:4e8f:b0:493:b307:6777 with SMTP id 5b1f17b1804b1-4953c273de7mr4061435e9.22.1784065556082;
        Tue, 14 Jul 2026 14:45:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm118533945e9.13.2026.07.14.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:45:55 -0700 (PDT)
Date: Tue, 14 Jul 2026 22:45:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, Linux-Arch
 <linux-arch@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "David
 Hildenbrand (Red Hat)" <david@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Klara Modin" <klarasmodin@gmail.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>, "Kirill
 A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn, wangyuli@aosc.io,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Tejun Heo" <tj@kernel.org>, "Kevin
 Brodsky" <kevin.brodsky@arm.com>, "Anup Patel" <anup@brainfault.org>,
 atish.patra@linux.dev, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Dave Hansen" <dave.hansen@linux.intel.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Michal Hocko" <mhocko@kernel.org>,
 qi.zheng@linux.dev, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui Song"
 <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>, "Axel Rasmussen"
 <axelrasmussen@google.com>, "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu"
 <weixugc@google.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Anshuman Khandual"
 <anshuman.khandual@arm.com>, "Yang Shi" <yang@os.amperecomputing.com>,
 chaitanyas.prakash@arm.com, "Ard Biesheuvel" <ardb@kernel.org>, guoren
 <guoren@kernel.org>, yang.li85200@gmail.com, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech, "Muchun
 Song" <muchun.song@linux.dev>, "Vishal Moola (Oracle)"
 <vishal.moola@gmail.com>, "Nam Cao" <namcao@linutronix.de>, "Pavel Machek"
 <pavel@kernel.org>, djbw@kernel.org, yu-cheng.yu@intel.com, "Baolu Lu"
 <baolu.lu@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Coiby Xu" <coxu@redhat.com>, "Andreas
 Larsson" <andreas@gaisler.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn"
 <jonas@southpole.se>, "Stefan Kristiansson"
 <stefan.kristiansson@saunalahti.fi>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714224553.583c8445@pumpkin>
In-Reply-To: <aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
	<alYL7B0HAvmLVHGU@pedro-suse>
	<b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
	<20260714143450.61a94085@pumpkin>
	<aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_144559_169783_FF2255C2 
X-CRM114-Status: GOOD (  34.08  )
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

On Tue, 14 Jul 2026 17:06:00 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jul 14, 2026, at 15:34, David Laight wrote:
> > On Tue, 14 Jul 2026 13:55:18 +0200
> > "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >> > I see the compiler has an awkward time returning a u64 struct (see
> >> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> >> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> >> > purposefully toggling it on for testing from time to time.    
> >> 
> >> As far as I can tell, the #ifdef was originally in i386 and
> >> got copied to all other architectures at the time, but was
> >> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
> >> was introduced.  
> >
> > For x86-32 the makefiles request 64bit structures be returned in registers
> > (at the same place regparm=3 is set - probably added at the same time
> > between 2.4 and 2.6).
> >
> > Note that arm32 can will return a 32bit struct in a register and
> > arm64 will return a 128bit struct in two registers.
> >
> > The only problem is returning a 64bit struct in 32bit mode.
> >
> > I'm sure this code is arm64 only.  
> 
> The file we are talking about is arch/arm/include/asm/pgtable-2level-types.h,
> which is definitely 32-bit only and force a 64-bit struct return
> on the stack.

I've clearly failed to detect the environment :-(
The 'struct return by reference' is part of the ABI.

> I checked some trivial tests that show that arm-linux-gnueabihf-gcc-16
> also still produces badly optimized object code with structures
> passed by value, and will spill those to the stack for no apparent
> reason. clang handles those just fine as a pair of registers.

I'd have thought it would be ok if the structure had two 32bit values
and they were directly accessed.
The silly test I did earlier didn't spill.
Taking the address could easily force a spill in the function itself.
So that ((int (*)[2])&var)[0] (which is just ((int *)&var)[0]) is likely
to be problematic - or certainly heading in that direction.

> For the 2-level page table, this only concerns pgd_t, which is
> rarely passed around or returned by value. The 3-level page
> table has a 64-bit pte_t, which means we probably won't
> want STRICT_MM_TYPECHECKS there.

I did do some mmu setup for a strongarm a long time ago.
I do remember in being odd.
But I was only moving the software frame buffer away from the physical
frame buffer to steal a load of screen rows for a keyboard.

Is the 64bit pte_t needed to get the extra modified and accessed
flags there aren't free bits for in the hardware pte?
Would it have been possible to use bits that are fixed in the hardware
pte for the extra bits and write the value to pte[0] and pte[256] fixing
up the value written to pte[0] (that the hardware reads).

The arm docs seem hard to read...
(the left-right scroll doesn't help!)

	David

> 
>       Arnd


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
