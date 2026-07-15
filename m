Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8313FC44507
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmzOZ2ZXHu37/a77OE+GOHpuuV2mnezhA1Oqdls/9ZA=; b=Ewi8xSSy4hYoT6
	jHkeAhUg/liEqPCeKcspxafueFA5oyZ9O6A7dq6iFG6cCCnQrPL8dX7IU0OO8m3bEeGUtZPzMbCMo
	HXuArNbtDKDDlM58JymdSgxlmbEjtqnFUE/uWpAk96zTu8r7Gj05TxVBrO6XqFUYgZDNwcZUTyrIf
	GGZXyMeU0fW6ZaUzcoPHkzWkFJVzH2CtctKDr8yl0pq/x19YKOgyu/4FqL5muB6Y4Y4QfBOPPqCKI
	5FrDj6kbb1wOa8CqQhJMibytxMd6vRg9W91w1IOCaYIVs7Qj4qUXzhW1FOCtgX2wzItabkwI0asu/
	mOi858EzLLtlm6K+5oUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx2H-0000000ETwI-2eyJ;
	Wed, 15 Jul 2026 10:40:17 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjx2E-0000000ETug-0cV0
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 10:40:16 +0000
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9061a795d76so18424646d6.3
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jul 2026 03:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112013; x=1784716813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BcTdMoZv6JVy6M/fO3WdP9FofoXGw30zAP9bsFgIqfs=;
        b=LwZLvbLOJVAQj3yySa2fYf8mzKzgJ37SRObUfMRCckU3ZwZl93qZpr8705elvQSdHv
         n69CerFLGqsvt2W6snN979owixiisSIDSWwqpuZXxc42LBb4JQK4VMeDkqZBfYPWmxyk
         w4ryBmaGhjM//GxRMA46NA9otMgZsDsLy62Ea25dF5h4oU+OwpuxZbBK3C8+mVihP3Ke
         gL3tkPzIxuDTT16BpulW1FK6lAWpaffED5Ad+Mvb/SPNJE9xj6SmpchniN0e1xH7Z7BO
         xfgQvbIx1ppLqlV+QKF1AQaMzrBIv8U40p9n63QJL9x4Bcr2aN7TOcKSY/Jm+PSDOjus
         5yGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6VcRAYJ5N4m3YxfdLhilo9UX7ptybQR5NRYkI8iGt2a04AnpOjUOL2GFiFWLjjkev/pZaSDrUHic=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd61gF9+bQdrOxPU2yZeHb3B/oIoAHDyi1IrSywPEyO/5i603n
	0io84C9LDXaeCdQliR780IEEINGZe4S++SUIxw1iKkUKKYZiRMBuga0DAoq04FsgDls=
X-Gm-Gg: AfdE7cmy0eOmC2rM5T4idR1WThecEJJv2oGEXz5on0tf1gVvjX7Ym0vW450rjBdCX4C
	vEkGLUamUTBzfVqK5OdOqQrISbgCU0s8sxGAe7DTUNfDNodB1p34uradUGs0crZMmcG++IJat8S
	X6nPnN5W74sEUIenHXO+7Jx2miYc+B/LK069JQh4oGSfvqB0ozU9WAiXZK98Mcl1vyjkDMh3tmm
	MBtVePuDEXqBVi5LQrHK9A9wV8NbGVx96Ku8KDBxknGNznA035oIT2CxLfm8t/OxhWBZJ4hfDP9
	ZsbiqCwInJHLGFA2SLFPqIfNDmMcYV3L16SN9aM+UB57fRE5uoE9Er5byWEGHdx/3N4vzegwnoh
	kTB1VVuEFJGeviN54rFais3d8a6ot01FAOxjEyo+a7Ph0FhdKl6nnSmpd41iRTwuImQMygZLYSo
	x6g0/U76hVZG8KVtI7oUsi+P3hwx+/7ki2lSVmP7RaRaUzuqbWNg==
X-Received: by 2002:a05:6214:8115:b0:8f0:2653:4a9b with SMTP id 6a1803df08f44-90403261f7cmr124957146d6.39.1784112012777;
        Wed, 15 Jul 2026 03:40:12 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm190254016d6.35.2026.07.15.03.40.12
        for <kvm-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:40:12 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f18d92172aso26281316d6.2
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jul 2026 03:40:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp/90TcqXTzzGeKN7qOTwmC6zKP6aL19/dmu7D3aRRmGo53H80SZ5KQO57XJyOQaZ8NNtR6yZI+Ma0=@lists.infradead.org
X-Received: by 2002:a05:6102:94c:b0:730:db02:1d08 with SMTP id
 ada2fe7eead31-74533c1eae8mr11245328137.10.1784111681255; Wed, 15 Jul 2026
 03:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com> <aldV23PwIXnFloaN@e129823.arm.com>
In-Reply-To: <aldV23PwIXnFloaN@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 12:34:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
X-Gm-Features: AUfX_mxU0lxjO-fzCeQeNX344H_SVkvovWXaE8EEgaGKFYO5e9NLd2LkTofC79k
Message-ID: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260715_034014_193583_704F766E 
X-CRM114-Status: GOOD (  21.73  )
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

On Wed, 15 Jul 2026 at 11:42, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > --- a/mm/ptdump.c
> > > +++ b/mm/ptdump.c
> > > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> > >         st->note_page_flush(st);
> > >  }
> > >
> > > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > > +{
> > > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > > +               return false;
> > > +
> > > +       if (mm_pmd_folded(mm) && level == 3)
> > > +               return true;
> > > +       if (mm_pud_folded(mm) && level == 2)
> > > +               return true;
> > > +       if (mm_p4d_folded(mm) && level == 1)
> > > +               return true;
> >
> > Is this order (... && level == ...) the optimal order?
> > On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> >
> > > +       if (level == 0)
> > > +               return true;
> > > +
> > > +       return false;
> > > +}
>
> It is. since the purpose of ptdump_pt_level_first is designed to be used
> in the *callback* of pXd_entry(). IOW, if we check level 0 first,
> it always returns wrong return in folded case.

I meant the order inside the if () conditions.
E.g.
"if (mm_pud_folded(mm) && level == 2)" does the expensive check first.
"if (level == 2 && mm_pud_folded(mm))" does the cheap check first.

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
