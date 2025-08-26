Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D34C8303F
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 00:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kzd+IWu4miHr9qXbK92JAK2w3KhQUyOxbITQL0gzAIU=; b=prjRYIetn8Ehqh6VUxUnL6adnw
	uxd7T9egW/yK6yoV7vwH992/Xn7o0vGf13LWIx6mZtZ/VnbNpTWxtvRUidWirloD6C8XzHjSs3QV0
	kKHNgsPjFxvPh7rEpQQbURQDpWHf2+jNZ+NXQ6bv5guq/OH6IXJVRJtlG2cdh5gIuqqgM+WD0sQFr
	IgdESOHSxKcaypkdFelLjukns6s/U8P/HaSLSrlfacpvN6jtsed6QZD+rnJUz6JpQPLC1nxy1o8a3
	eXW/5cDIuaacTXhDCdf8PNCkfI6sBw5JehHSeYSJ1Ax/CoqpkzaCTRVPa7PmGvgwdvL0kxjctA8UA
	dEosZquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhWz-0000000ACVz-38CF;
	Tue, 26 Aug 2025 00:27:21 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhWx-0000000ACV2-1x87
	for kvm-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 00:27:20 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b49da0156bdso3036167a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 17:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756168038; x=1756772838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4ctZNwYJMz9+Hk7ge9l8ZiYDw45Y30bqY3Iaj5/gqE=;
        b=2zg5qTi86OMXtxUePXkzOJeDylIRi+CibX6YG/2IEujUFFX03j64NtX18W34AqrvDR
         OX7q2+vEpAsQKSw4xNZnZHCuJ+B478d5L+tCdcxBumYjkrJQvDMiuW7PnaxQhCUP7boI
         ZrPnnvQyqO1NjSO5mXwpFU9U75GIyA00fDGe/jHBM7oBNCPQyTNsbBlF6tI6+rFSqL8N
         lOQr3H5QlNC9GL+n/MT+62VBIJ9njWfn4NMofZImwUMdZ/B0+SMict7n7T4yAo6F2iAr
         QUsOm6tugl+CO7IdIzdC69oKS++NEpTzr8Bmo3jPzzLbow4qy2I9FSuUQJka9s0kEgis
         KgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756168038; x=1756772838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4ctZNwYJMz9+Hk7ge9l8ZiYDw45Y30bqY3Iaj5/gqE=;
        b=iWKP9Q0ielq5/IlAAxWX81MTgiHHH9pvMbPAbXEvv9bYsOdryCblwrPPQjIIZBh/Nb
         kczKxHy1AQrSijwNZ0MpS1az9wjGqbscULXUASPtI+7XJcF3Bj57XaVZ0cC2JeB8IU2W
         WmU46fiCLr/7q4OPfAX/h67c3jymoNYKhlMfPzp4+NS4I4XVkcHkjiu48HLjEymOIsKE
         ziTlsfwt/TVTGaqjSR79QVBaQqvCHX66CgziFCWIcAgwcmYsgUqijexJbWmjdIGjGgZj
         5oWbsaUtbVDw8eHng4RqwpVtsJuTE9iZB+UY7jimcTBzf63W9YxfHKBUgggQ9pA/tQ1R
         8qDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVabN2xb2xP7L8NKJ4tEmbIqPKct9U0IZHKZz06qqBbP9UPhZVLppkaUy/gRos+N1+2Fm62XldFHjc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMgXbF6kDuLdEHlk9hPBijztpnJuw2w1Xf5CWctOsly1J+29h8
	DSnicdPGVnf0OB9HZCUs1kYDnKXSo/8L9kmHScDW950qSy3QFs8qYoyvc7gXnGf3+iXutdRwJQz
	b74bZlA==
X-Google-Smtp-Source: AGHT+IFw5Mjf6HTcAUWU+u7CL/B6QAA0945o29LTS2VrhL4i1mL+9cXlmfjB4AEyc0iYoyyJlQoJr1vqexM=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:30a:7da4:f075])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a105:b0:230:8b26:9d47
 with SMTP id adf61e73a8af0-24340ab318emr21164734637.10.1756168038330; Mon, 25
 Aug 2025 17:27:18 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:27:16 -0700
In-Reply-To: <3188ca61-2591-4576-9777-1671689b7235@linux.microsoft.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com> <3188ca61-2591-4576-9777-1671689b7235@linux.microsoft.com>
Message-ID: <aKz_ZMvvF0e9nwSn@google.com>
Subject: Re: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common APIs
From: Sean Christopherson <seanjc@google.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_172719_510299_32DB1DA5 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon, Aug 25, 2025, Nuno Das Neves wrote:
> On 8/25/2025 1:06 PM, Sean Christopherson wrote:
> > Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> > deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> > more generic "virt" APIs (which ideally would have been done when MSHV root
> > support was added).
> > 
> > Assuming all is well, maybe this could go through the tip tree?
> > 
> > The Hyper-V stuff and non-x86 architectures are compile-tested only.
> > 
> 
> Thanks Sean, I can test the root partition changes.
> 
> A similar change will be needed in mshv_vtl_main.c since it also calls
> mshv_do_pre_guest_mode_work() (hence the "common" in mshv_common.c).

Oof, more dependencies.  I suppose the easiest thing would be to send a series
against

  git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git queue

and then route everything through there?

Alternatively, frontload the MSHV fixes (which I'll do regardless) and take those
through hyperv and the rest through the tip tree?  That seems like an absurd
amount of juggling though, especially if we want to get the cleanups into 6.18.
And if none of these lands, it's MSHV that'll suffer the most, so betting it all
on the hyperv tree doesn't seem terrible.

> Also, is it possible to make all the mshv driver changes in a single patch?

It's certainly possible, but I'd prefer not do to that.

> It seems like it would be cleaner than refactoring it in patches 1 & 2 and
> then deleting all the refactored code in patch 5.

Only if you don't care about backporting fixes, bisection, or maintaining code.

E.g. if checking NEED_RESCHED_LAZY somehow causes issues, it would be really nice
for that to bisect to exactly that patch, not a patch that also switches to a
completely different set of APIs.

And if someone is wants the fixes in a pre-6.18 kernel, they don't need to
backport all of the KVM and entry code changes just to get the fix.

As for the maintenance headache, see above.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
