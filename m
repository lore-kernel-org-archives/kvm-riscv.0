Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9640C3600D
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 20:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/HPUqEPpb5YlBHFzwvPL1hYFLQ7F/INdva5T1ev22Q=; b=OedOHSsc0lojDh
	6a3muV8WmWzf3uG0cCcKhOS0Ix3pbPLCNpm0rfhZNgUn2sLBioMkczLjP3XvSJWPTZfkXafBbpHg2
	v3Ea8OXhr15jNBjKwxK20gGVTUKxQslfLkBTVIjw/UsvxyLLUyIyA5cKHfFKmOfV+OHtWYVkClMk0
	jCkn851W3eKjeDjzQjgZudKgM+YGsItGE6u5agwQrNCRJ+llPaWCAAxLiAGkr0U4rHJh1XmOBfDdl
	ZMRsFfFfxFPDRwH/m+qQf2Cvq8R2Rc4vX0RLQRdKhy4WFCETelJ8spMPFEdOVOrJHzs6K0UsQj/9k
	9/Q6jiru5bcarHOfI0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txB5t-0000000703i-1qbh;
	Tue, 25 Mar 2025 20:41:53 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txB5q-0000000702n-42nh
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 20:41:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-abf3d64849dso989644866b.3
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1742935309; x=1743540109; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=MKxBeA37trn+juEvfwfWdOd7jgkqH8fTVTMk4eK9L45C5PJTC9Y1Ig5//IR7l6haVx
         /Ne/21Xo9NtPKncTpZIOQXlgSGNetMgItHyDOGyRtpiidyO7/yBXGn4wsuiu0kinxKTh
         x2nl3wSwszAWw4x/m+M+Z+9syijDNE3DdnleI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935309; x=1743540109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K52xAWNW5IEkY2W6yv56tbrXz/O78EY3OFwe6Kmcp1A=;
        b=IAAVdUh0DK5fzY/IUsu48zm6QaDEF7k5L0ofNPz+GtanLihwyX3xlp23LxW4PcmKv4
         QN4As/S54UOU5blmMnJ+aY94A3noowFCnp/hEO1bph4+FNgVgyXu2jyAGDFAsG4DBkEN
         ZBrA2IxwRVgP213pyF8fE9D2VI3se2arcakGX1vXn4ZtrR9TYaEM5ckiIOxf1Q3I+oP7
         tlZzjtvnGs88PTFKcyQa1zgLwkkYJVqn/YlsU1BA/aFVSjafG+Q/7sDofdDQ2zN71ffI
         KCH8rRDb7GnjA1Ic+JPZCzYuelhaKR4sFJlDAC+jYAduy+DXo83Jem7K2HT8xlF2FlG+
         zLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvwEmsLShWeC8/+EWZY1an32QOhIHxLe/2sDjmFgrG4q2Itz8BVSHFzLeaLSIOYrmb88pXyYlWF1g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRJwbPxiYij0pJ2/av52dPKVBlFsVxBVEaoZ28d88shqvv4Cfn
	NTi764pF7E9ffne6ragwxF0YkCqAgz6f1Ncm58fdHkBZklcJ6AQJvdBa/kYmg7E/B+hZgziBDWf
	Mak4=
X-Gm-Gg: ASbGnctUrTUPPRBf4YMwcvVK+H5d7no4QkdEJWKK22sHVx0rf+KHSNKdNkZuHWRAdwN
	REXERHOQ2EIr0U+4IUKaGgjdyWqVH56p2OuI3iGsTbE11QfdjYtFNevdafsLiJaJ8ZYP4UjbJNu
	i8jMaFK5a4f5hMaLv4+GFMVKVWhH2vnmgkqb1ssy3DZTmytKnKIGhCZV/P2dd5CHNasntDtZNQ/
	BcMRNEI9PfoFG/tqgaOao6onTmKcdHMa/DfLmGF72+pXq1VojydgxRdae6a0k8KREbg9F6b15PR
	2PwWrkm9vWI7l5KWb0Ro5GwDsM1nZIyzArONctHWZK3bKUMUyLkWW6/GD1DqHOaGEJ9bmPJdPio
	a1RwD0QdJ07//lEOxdR8=
X-Google-Smtp-Source: AGHT+IGDOH9HDhT6IHbUg3CjbBj76Uvr6uOJRa854+8u15vhxf7zIj7sdDtWLHskewldpFWYvwJBdg==
X-Received: by 2002:a17:907:3e26:b0:abf:5f3c:58e7 with SMTP id a640c23a62f3a-ac3f241b9demr1982354366b.3.1742935308793;
        Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3cbcsm902672766b.49.2025.03.25.13.41.48
        for <kvm-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so853127866b.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 13:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzo/TJeB3tccqtkK/PuNvrW5a7KgtVwGeL1vcmnI8PYmDPmgKchYVO73KvqGuqT9MQFLqeULHKU7A=@lists.infradead.org
X-Received: by 2002:a17:907:95a4:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ac3f27fd3b3mr1859596466b.48.1742935307883; Tue, 25 Mar 2025
 13:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-2-guoren@kernel.org>
In-Reply-To: <20250325121624.523258-2-guoren@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Mar 2025 13:41:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
X-Gm-Features: AQ5f1JpwFc7ifwGuAhyrs4E5qPgHx1McCR38KFycRhkLFRMKTveHrmoaWi4zba4
Message-ID: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org, 
	mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com, 
	inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_134151_013142_0315A712 
X-CRM114-Status: GOOD (  13.89  )
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

On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>
> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
> leverages the lp64 abi Linux interface. Hence, unify the
> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.

No.

This isn't happening.

You can't do crazy things in the RISC-V code and then expect the rest
of the kernel to just go "ok, we'll do crazy things".

We're not doing crazy __riscv_xlen hackery with random structures
containing 64-bit values that the kernel then only looks at the low 32
bits. That's wrong on *so* many levels.

I'm willing to say "big-endian is dead", but I'm not willing to accept
this kind of crazy hackery.

Not today, not ever.

If you want to run a ilp32 kernel on 64-bit hardware (and support
64-bit ABI just in a 32-bit virtual memory size), I would suggest you

 (a) treat the kernel as natively 32-bit (obviously you can then tell
the compiler to use the rv64 instructions, which I presume you're
already doing - I didn't look)

 (b) look at making the compat stuff do the conversion the "wrong way".

And btw, that (b) implies *not* just ignoring the high bits. If
user-space gives 64-bit pointer, you don't just treat it as a 32-bit
one by dropping the high bits. You add some logic to convert it to an
invalid pointer so that user space gets -EFAULT.

            Linus

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
