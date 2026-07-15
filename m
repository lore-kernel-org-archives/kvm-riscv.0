Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4281EC44501
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLGZrHvNppNX+zvZ0INMr24NXHriSoYyIi/0JGMC4EY=; b=xWzCyk+RF1Jn8u
	B9H/68Kq26y69SgvuZ1MWTLJwZm5t4jZ2t/iRVKN7Sn95q/VPRF5A/Ikj7ss6yrUJp7v1EQcKOtql
	I0SweTordhFzRuiBo8jCBHpaxau+RCZj2x4B3JyzkQ8C6SDk/Gk35LW9y27SEeHAs98Hc38+qTpoB
	hUNDuCFfKJMUUAi8oknTJd7iBR/swdLOic70GQtnX4tUcfwwWrIsRHEkF+udO30R2moBRVYqbV59j
	okCP5LIrQT0brNByK7pFEOtMrItYjdPvPcr7JvJgVNbMGkJl7CPu0jTcFvTW3wKfkHGZNTxD4WTPo
	lQtObWHRKSGPzUepn5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuR0-0000000E56U-3Z7z;
	Wed, 15 Jul 2026 07:53:38 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjuQy-0000000E55O-19x3
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 07:53:37 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ed2a00f12so5854847b3.2
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jul 2026 00:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102015; x=1784706815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hqKDqOfd26TqLmXrf6Sno+8+vAQxzNMwBOFafeUJRw4=;
        b=Y+77C9yrI5XjJD5drq3lhoNaqxqhyc2NkyD/0PCm78nhH9ac0F4YlgKYS+HsMPHKjd
         8kIYqD7ze6Z+HeH+ozz/wo7FtAqNyHBhyDHfEYUHbZpl4jhQfn/SE3oLIoHaflBnGuSa
         B28oWcwqN4VH6TnUISjAztKjIUYfcWFO2oLRvQ7+1hWXmisaBREvO7S3T73fpzmO1E9a
         vnCP0wA3AgYxaeQrD3M2HKY/WAzRjuaI81VrUBmpIMO3LbrKzn/EowAt9BXJaUqzUKcT
         Ai9BaWHUIwFkJb3t2GemC6SWPg5XDbWRzRgZEQB0WqktQ+P+efMm04LUgYNSGr8SoQwH
         4BDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrbsu8ypmv6xcAwDmX8ihA9a52PhDBMTtO5MTZ6q4QldnoW/43S5XVxi8g/AQakWFsA6vUGsntq3JI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQTw5VS3EBSNb6lxLpV4C1F78t/1J7nOJn3MLjtVW2QnbGpAHr
	WSUW+KyPkv3e4rDJ2ETWFeufTDGoNcV582qbykXNZl0H3Eowlr6ABsVHQvu3yOZRKtg=
X-Gm-Gg: AfdE7cmydbicCb47sMiQKjsxWlgWcIpDrBYFxX3WiSIe4gBDiPG1fjV/z5MMem78fJ/
	9D3aOaFQVQ5a5ffykURc8AW2fBHBXgLSsuMql83YlSCwWJM2iwkuTvkx7Liq3uDCj7m3uqcd8ac
	fhr7zgKMROu3HXyAtJevUrUXWk5+vLNBh8I1d2qQdBv/DM9P+qblz8laNHbDc+hhz6FPI/rv4tu
	5X2+iN19nBcChRcDBQ9xghApQ/xAH7KK1mh3NbLAqyJCjAftt9FX4A3W4//gH21w9yaifpp1Ud6
	k2OHOFIpasEJQoEj/dH2gKNt1nI0LDhgLpEMitWLlr0C0Qqnbzr/f9BpEtsr9Qtyo2Jo5YmbvaQ
	6NJiM/CKQ5L8wlpXM6N1m9pZDehnNNVkFJipgp07SVbvlYJl0BO80PCsy8hi4NsjyZBUu3Ow3+w
	rXez/+wRRDirq61HNvDpC4HLNs8GAQXNcIX8r8ZIGwKmRZpLAv3w==
X-Received: by 2002:a05:690e:4399:b0:667:91ba:9bdc with SMTP id 956f58d0204a3-668076cf8f6mr3015216d50.11.1784102014805;
        Wed, 15 Jul 2026 00:53:34 -0700 (PDT)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com. [74.125.224.51])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787aa1237sm18441028d50.19.2026.07.15.00.53.34
        for <kvm-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:53:34 -0700 (PDT)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664c535f1a0so8616979d50.1
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jul 2026 00:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqFJG4vb9z6vYRUlDSjQFXpRFAhGLNhtvaArxP8POS3coVDu1BvCURLikvDMQagi1M+0SPT1+JoaE0=@lists.infradead.org
X-Received: by 2002:a05:6102:6891:b0:73e:9fae:584c with SMTP id
 ada2fe7eead31-745875199aemr2922337137.19.1784101517020; Wed, 15 Jul 2026
 00:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <6007625e-c3f9-4ad6-99a8-61396bccbcec@kernel.org>
 <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com> <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
In-Reply-To: <alZo9feSrSB_StfO@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 09:45:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
X-Gm-Features: AUfX_mwGugbyQZ1JX8fgK_JNKs5rGnucGlnBlUaIc_V2N3HkDTrdgggdZ_cY0do
Message-ID: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
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
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_005336_397640_B5313EB5 
X-CRM114-Status: GOOD (  37.60  )
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

Hi Yeoreum,

On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> On Tue, Jul 14, 2026 at 05:08:24PM +0100, Yeoreum Yun wrote:
> > On Tue, Jul 14, 2026 at 07:35:19AM -0700, Dave Hansen wrote:
> > > On 7/14/26 04:40, Yeoreum Yun wrote:
> > > > @@ -254,22 +255,8 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
> > > >         struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
> > > >         pgprotval_t prot = val & PTE_FLAGS_MASK;
> > > >         pgprotval_t effective;
> > > > -       bool first_level = false;
> > > >
> > > > -       /* Ignore folded levels ... */
> > > > -       if (((level == 0) && mm_p4d_folded(st->mm)) ||
> > > > -           ((level == 1) && mm_pud_folded(st->mm)) ||
> > > > -           ((level == 2) && mm_pmd_folded(st->mm)))
> > > > -               return;
> > > > -
> > > > -       /* ... and make the actual first level remember the protection. */
> > > > -       if (((level == 0)) ||
> > > > -           ((level == 1) && mm_p4d_folded(st->mm)) ||
> > > > -           ((level == 2) && mm_pud_folded(st->mm)) ||
> > > > -           ((level == 3) && mm_pmd_folded(st->mm)))
> > > > -               first_level = true;
> > > > -
> > > > -       if (!first_level) {
> > > > +       if (first_level > st->first_level) {
> > > >                 pgprotval_t higher_prot = st->prot_levels[level - 1];
> > > >
> > > >                 effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
> > > > @@ -471,6 +458,15 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
> > > >                 .seq            = m
> > > >         };
> > > >
> > > > +       if (mm_pmd_folded (mm))
> > > > +               st->first_level = 3;
> > > > +       else if (mm_pud_folded (mm))
> > > > +               st->first_level = 2;
> > > > +       else if (mm_p4d_folded (mm))
> > > > +               st->first_level = 1;
> > > > +       else
> > > > +               st->first_level = 0;
> > > > +
> > > >         ptdump_walk_pgd(&st.ptdump, mm, pgd);
> > >
> > > This is indeed an improvement and a step in the right direction! Thanks
> > > for looking at this.
> > >
> > > But one of my test for whether it's good x86 code is whether there's any
> > > actually x86-specific logic in it. Isn't this basically a translation
> > > between the integer level number and whether it is folded?
> > >
> > > That seems like a common helper that more than one arch could use. Could
> > > this be stuck in a helper so that all arch/x86 has to do is:
> > >
> > >     if (mm_pt_level_folded(mm, level))
> > >             return;
> >
> > Yes. at least the level semantic in ptdump (pgd is level 0,
> > p4d is level 1, ...) is same to all archs where use ptdump.
> > So It seems reasonable to add this common helper in ptdump.c
> >
>
> Furthermore, the effective_prot() need to require to identify whether
> it's the first pgtable to prevent the inheriting from dummy value.
> So I think it seems to make a ptdump_pt_level_first() like:
>
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 973020000096c..2ec5700e4be5e 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>         st->note_page_flush(st);
>  }
>
> +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> +{
> +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> +               return false;
> +
> +       if (mm_pmd_folded(mm) && level == 3)
> +               return true;
> +       if (mm_pud_folded(mm) && level == 2)
> +               return true;
> +       if (mm_p4d_folded(mm) && level == 1)
> +               return true;

Is this order (... && level == ...) the optimal order?
On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.

> +       if (level == 0)
> +               return true;
> +
> +       return false;
> +}
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
