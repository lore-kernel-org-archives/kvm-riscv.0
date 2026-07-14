Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6E6C44508
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7Oaa40n+6kX97Wq3FgxYMSV0QkxXQfA93E9NiY1DpA=; b=U02RH8AXlpjYh6
	+QxyQOt6Nix9d5l5F4btQQH9F/uStrfinrRUPRkZ1qQ4kOilMbpUCcIq0AHC+or6ffbQn0VIbSR0f
	ucAnVNkkT3RqH1R37pnU/zAiwQDknugMuxlBWS53FCeHxi2XA6+bitgU0P3s0kx0YSWMkJm+FZTph
	jSS3oBn86NEZ5emRCKFIq9w+cDEyWHXuNZo0IyFQRcEyoY1u5naUfLaf7aYgvv/XETt8VOcUB0xIb
	8PhjRmAIoTEsnF/BnGnt0BtbvKhVui0UQp69fLThQ5DlIx2SZ9VvGdqxtPw+alUNKt/UBFgll7f9r
	eUGWCxEdrBG+dGGMATag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdHp-0000000CC1u-2P5J;
	Tue, 14 Jul 2026 13:35:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdHj-0000000CByy-3aUa
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:34:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2628489f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784036094; x=1784640894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1tfMkiBqW2Fu1p0sa+0Qy+YQWqKnxqq1+cNEQovCl0=;
        b=b83yhHzBkmNluMoe0lPPjI/d+8OSnVmVDyEYo2+65aimu83rz+OJSfBQsNvqdMsdch
         LCcauAs1GyO1zcSIyZyww1sb3tuExI6/KQJl5sXk4OgRhdTprzIt//zcP00v0Dxb1id+
         s7sxqtWLkntERpepb6eMohJoCdrMLZiH7XNWS24b1m684A+lYbnUE/z+BvJvKlkvRM4d
         z7rNACabpsO/yIBmYHY0HOywIdVoyfzIunbzAb7vIbu0BEwd5fbxwTI2YZyw+yVxxp/a
         5Upj6vbaRLaQw0OauOmLOAs2WOtHnE29Ddgb5WrI7nDlCOjMop0gUHr6JVR4TD7NCtzR
         r1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036094; x=1784640894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1tfMkiBqW2Fu1p0sa+0Qy+YQWqKnxqq1+cNEQovCl0=;
        b=G21EG0WCLNAMwU6TADLXWGtonw4WAU7XKA7svpsCybu3Orec2aTOyOaTD2Jr6D4Jmq
         +OxLy/VV88nF/4e0A5zdu3OyxFL2ij/0QFytpfIkKF6rxXZ4te4pxaj0Qk51HlapQQIS
         8KPQLnL91/Iibpu+i3uY6FYfxaKiGEIy/5ITOAK/ZdfvIsYx1g8AKgE3B3xIIsTTWR3X
         Sjqba4MYgCiR0g58YhvWp/lx8OThFsrjOR9aqfVAaC8lkf86km7tbOv0A6/5FXqbMgVb
         KDsa5N5qJrYqwWK80QCJk0QFovvShnC++9pqsef3NGiMB8i1h9zKNysLrFRKgGroe7Mu
         vnvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKz7NnEP01k/w4hAeD9yfj86wkfiYVlFbFUQCfWqgrxmjbt0O49wI3texGQeGebfABBFIdaKqXHl0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx94xl3gsezRbAs3SYfX/40MvwxWyAglrGukpeY1Ege/9RjGBK1
	g0ppUMCb2wScCcZ7jo70asJOEnRZ/aL2aQE2RL36ihxCs+jIhXylgteb
X-Gm-Gg: AfdE7cmpPUh8VRmw8Vui3srVw3oZAu0u5dX2vbGxGGN6hXleB/MMPo6gKUYK06svbJE
	srkx+nv0fImvJ2pEe6ImqfEg2O0tfZkSX6EO6M+MRG679CMYfLyaxRB4WNMml0saWuR8MeuUUgI
	yLNP+fWjCdn2K9YFT7GDozp3Rf7YnCb5UnnNJeXXQZ+ZyTlllbvFY4+NY/qY/SvutBD2GnpzndU
	mbmc0LwVMubLWikTZECSelmPkB0kABck/Eldd0ih4Fc1PFtboIs0X+mOTYjYSwmCocvkPeWXPIB
	dEoL06gWMwYeKkVb1bc0OtG4gUocZFB6eUveknBUFadvFBs2C4QgX9yZr9rZ2FVjZN3mUe3Ubeh
	M1dCcUQhMlATJ1cnEwiXdU6UXH/wOQrsMjyhjngyPTef0nwW9eaArVfVNHLsHCf0Gtcc+AoczsB
	MOCUxpvAXbFgb/1ffZ7XCsRTUBRdKZwUr9HEHEfa6k9jV7p8R9t+iHknSNINE2
X-Received: by 2002:a05:6000:26c7:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47f2dcc02eemr15207624f8f.25.1784036093714;
        Tue, 14 Jul 2026 06:34:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm8687695f8f.9.2026.07.14.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:34:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:34:50 +0100
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
Message-ID: <20260714143450.61a94085@pumpkin>
In-Reply-To: <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
	<alYL7B0HAvmLVHGU@pedro-suse>
	<b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063456_006052_3A7FABB3 
X-CRM114-Status: GOOD (  36.38  )
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

On Tue, 14 Jul 2026 13:55:18 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jul 14, 2026, at 12:26, Pedro Falcato wrote:
> > On Mon, Jul 13, 2026 at 02:55:41PM +0100, Yeoreum Yun wrote:  
> >> From: "David Hildenbrand (Arm)" <david@kernel.org>
> >> 
> >> We don't want pgd_t to be an array, as it prohibits returning it from a
> >> function, like pgdp_get().
> >> 
> >> So let's just use an u64, and extract the right 32bit value in
> >> pgd_val().
> >> 
> >> Leave the STRICT_MM_TYPECHECKS case alone for now.  
> >
> > I have to ask: is there a good reason for the STRICT_MM_TYPECHECKS ifdef?
> >
> > I see the compiler has an awkward time returning a u64 struct (see
> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> > purposefully toggling it on for testing from time to time.  
> 
> As far as I can tell, the #ifdef was originally in i386 and
> got copied to all other architectures at the time, but was
> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
> was introduced.

For x86-32 the makefiles request 64bit structures be returned in registers
(at the same place regparm=3 is set - probably added at the same time
between 2.4 and 2.6).

Note that arm32 can will return a 32bit struct in a register and
arm64 will return a 128bit struct in two registers.

The only problem is returning a 64bit struct in 32bit mode.

I'm sure this code is arm64 only.

	David


> 
> For some reason, only sparc32 and arm32 still use the non-strict
> version, with arm having changed from the struct version in 2002:
> 
> https://github.com/tbodt/linux-history/commit/5a8202f0259a
> https://archive.armlinux.org.uk/lurker/message/20020306.213958.cd486eeb.en.html
> 
> > If STRICT_MM_TYPEDEFS's worse codegen doesn't matter then maybe we should
> > permanently toggle it on.  
> 
> This would definitely need good testing. It's possible that it's
> not that bad on modern EABI builds (i.e. everyone these days) as
> well as modern compilers, as OABI definitely had bigger problems
> with 64-bit arguments.
> 
> >> +static inline pmdval_t pgd_val(pgd_t pgd)
> >> +{
> >> +	return (*(pmdval_t (*)[2])&pgd)[0];  
> >
> > Ugh. This isn't correct C code. It only works because the kernel passes
> > -fno-strict-aliasing.  
> 
> I think the bigger problem is the code dereferencing the pgd
> pointer in the first place: Since the pgd pair is written in
> 32-bit units in __pmd_populate(), anything reading it would
> technically have to operate on both entries.
> 
> As the kernel relies on -fno-strict-aliasing, the type mismatch
> is less of a problem than actually doing the potentially wrong
> thing.
> 
> As far as I can tell, we are however saved by pgd_val()
> only ever being used for debug prints, where printing
> the first entry is likely all that is needed to analyse
> the real bug.
> 
> > I would recommend either forcing a struct here, or
> > using a u64 with bitmasks/shifts.  
> 
> That would require extra complexity for the big-endian
> case though.
> 
>     Arnd
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
