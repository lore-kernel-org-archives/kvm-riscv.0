Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3607ED3B7E2
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I/Tjvm6M5HvXhVzuUhhgtCEvvf4IroFCrwZkzkmiB5o=; b=4UseRBIsvX7c0AllJx+l+bGPBU
	9cAlZM8fhjcpc439mhYV9hXulk9EW1zegdUB53p2aG3Gyq1bam0Do+IBUu705Dy9kE6W0nsa+pU9f
	w+E4O67w06+p5wJhrv5MrztUuqNTkRKSLZrdMPAD1oUEOm+MDwhfDQOeIjV9VcMEVYV8/h0WpMcgQ
	h6hQMbGgHk8lqtQOjbkI6yi79r7+QyZE+m8a2AA2rRgkbp8d9BrJZSzLrgLGaWFz1q/p7lh0/lABm
	hw56xJ9bogj6VPm4E2xKsI3fjPkHob6McTBo4fDWVlLoZ/HcvnUOXcAWs3DjNpllIjbLzJxayBSui
	wXGOeUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfeV-0000000DPth-2h2F;
	Mon, 08 Dec 2025 18:08:03 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfeS-0000000DPsN-3exH
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 18:08:02 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340c261fb38so8127157a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Dec 2025 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765217279; x=1765822079; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SF6h5hGtRuMyBRglBJmpKQuSrVGlyuxXyhedVebSd6M=;
        b=rY2uZbqVR52TSP72znPUL8jA5ul05kEze0XOV1OIIlCaQXC6HmuBPUsznpSlU8w42+
         mFzVS72bLZV20Jbz+sbfdSzukqigPAasmS7l3gnyDIe2IISJhRpzBTz3Xno5fKF9HaUS
         8WY9ZXiQNkmW6bPeDv7XPu9iDQ4P+7/P48gjLaixWLGXUj4u5bTaC6K/+Cv0Vf2NDKXQ
         YtLcF5eF1l1tXca9mnz86QfpWZOsgPL880wag/ZOqmhKIiUp4HC9PqkA1XHxMdhHkbPF
         uRO0ZlYisFpHEheeyullDxyozIdy3+x+29jnPbwMAsuO2J+izI3HPVI7YsLalDbGHKD+
         f4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765217279; x=1765822079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SF6h5hGtRuMyBRglBJmpKQuSrVGlyuxXyhedVebSd6M=;
        b=xT+NlBRY8gbKyWQ2XoA71m2fxkzO+murIgaRcIDMP4s++GV34PQ9tjox16tNpwagnj
         Bk4y0lnbwfnZgTDzoB6WXpEi9b1uNez6RJ6Ulmn+ZsfcwPQUa4wBa5lVdhLZ31DQYAmx
         PSVaQKv+xCVVSSROjJTksi/cG3djwXw5H7K9xxKRaSLSu99estH1eZKFER/djAL5UiYN
         gy84BUrVpoIDIUSr2c7Or+N6NNUX9UEp+1/yS1UfjMv4CHuN+dqntDUBt4zt8jLhI91K
         cvcw1lVxW8WPLzs66Tv65PoiNfzKWP+2IVx4SONg+QsfqPzN9VGox7tf5rXuq3r3cQRq
         CQhA==
X-Forwarded-Encrypted: i=1; AJvYcCWGj0w0nxA9fRc0eNA4n5PQnOcXfXXAySt+gvLubg2yIt9vV4CV/9nKg8S85TyKbBF1q+fxkjdgIIM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl4Geny96bL7plD/UROfCFpZlqYZm4f+kJn3OpXWsTJAydL42t
	vPhesGivqe98PZdkbUv/4kkbccr6DzbkxxCKnbi2vcGRmXoc6u+QpmEfbfa+RHY1IbQgFbTY349
	viRL4zQ==
X-Google-Smtp-Source: AGHT+IH3HhOiXlRek80ArMNgo8utGCkumZ6GCHftobZYLKaRSJ46MkO0EFccaQp1M2wj9T7xKajFvZIZ67U=
X-Received: from pjbfs21.prod.google.com ([2002:a17:90a:f295:b0:343:6849:31ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2787:b0:349:8a8b:da5c
 with SMTP id 98e67ed59e1d1-349a24f2f71mr7253927a91.11.1765217279160; Mon, 08
 Dec 2025 10:07:59 -0800 (PST)
Date: Mon, 8 Dec 2025 10:07:57 -0800
In-Reply-To: <20251208115156.GE3707891@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-5-seanjc@google.com>
 <20251208115156.GE3707891@noisy.programming.kicks-ass.net>
Message-ID: <aTcT_QcQaqyHV_S-@google.com>
Subject: Re: [PATCH v6 04/44] perf: Add APIs to create/release mediated guest vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Manali Shukla <manali.shukla@amd.com>, 
	Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_100800_905510_3A5E1B45 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, Dec 08, 2025, Peter Zijlstra wrote:
> On Fri, Dec 05, 2025 at 04:16:40PM -0800, Sean Christopherson wrote:
> 
> > +static atomic_t nr_include_guest_events __read_mostly;
> > +
> > +static atomic_t nr_mediated_pmu_vms __read_mostly;
> > +static DEFINE_MUTEX(perf_mediated_pmu_mutex);
> 
> > +static int mediated_pmu_account_event(struct perf_event *event)
> > +{
> > +	if (!is_include_guest_event(event))
> > +		return 0;
> > +
> > +	guard(mutex)(&perf_mediated_pmu_mutex);
> > +
> > +	if (atomic_read(&nr_mediated_pmu_vms))
> > +		return -EOPNOTSUPP;
> > +
> > +	atomic_inc(&nr_include_guest_events);
> > +	return 0;
> > +}
> > +
> > +static void mediated_pmu_unaccount_event(struct perf_event *event)
> > +{
> > +	if (!is_include_guest_event(event))
> > +		return;
> > +
> > +	atomic_dec(&nr_include_guest_events);
> > +}
> 
> > +int perf_create_mediated_pmu(void)
> > +{
> > +	guard(mutex)(&perf_mediated_pmu_mutex);
> > +	if (atomic_inc_not_zero(&nr_mediated_pmu_vms))
> > +		return 0;
> > +
> > +	if (atomic_read(&nr_include_guest_events))
> > +		return -EBUSY;
> > +
> > +	atomic_inc(&nr_mediated_pmu_vms);
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(perf_create_mediated_pmu);
> > +
> > +void perf_release_mediated_pmu(void)
> > +{
> > +	if (WARN_ON_ONCE(!atomic_read(&nr_mediated_pmu_vms)))
> > +		return;
> > +
> > +	atomic_dec(&nr_mediated_pmu_vms);
> > +}
> > +EXPORT_SYMBOL_GPL(perf_release_mediated_pmu);
> 
> These two things are supposed to be symmetric, but are implemented
> differently; what gives?
> 
> That is, should not both have the general shape:
> 
> 	if (atomic_inc_not_zero(&A))
> 		return 0;
> 
> 	guard(mutex)(&lock);
> 
> 	if (atomic_read(&B))
> 		return -EBUSY;
> 
> 	atomic_inc(&A);
> 	return 0;
> 
> Similarly, I would imagine both release variants to have the underflow
> warn on like:
> 
> 	if (WARN_ON_ONCE(!atomic_read(&A)))
> 		return;
> 
> 	atomic_dec(&A);
> 
> Hmm?

IIUC, you're suggesting someting like this?  If so, that makes perfect sense to me.

diff --git a/kernel/events/core.c b/kernel/events/core.c
index c6368c64b866..fa2e7b722283 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6356,7 +6356,8 @@ static int mediated_pmu_account_event(struct perf_event *event)
 
 static void mediated_pmu_unaccount_event(struct perf_event *event)
 {
-       if (!is_include_guest_event(event))
+       if (!is_include_guest_event(event) ||
+           WARN_ON_ONCE(!atomic_read(&nr_include_guest_events)))
                return;
 
        atomic_dec(&nr_include_guest_events);

> Also, EXPORT_SYMBOL_FOR_KVM() ?

Ya, for sure.  I posted this against a branch without EXPORT_SYMBOL_FOR_KVM(),
because there are also hard dependencies on the for-6.19 KVM pull requests, and
I didn't want to wait to post until 6.19-rc1 because of the impending winter
break.  Though I also simply forgot about these exports :-(

These could also use EXPORT_SYMBOL_FOR_KVM():

  EXPORT_SYMBOL_FOR_MODULES(perf_load_guest_lvtpc, "kvm");
  EXPORT_SYMBOL_FOR_MODULES(perf_put_guest_lvtpc, "kvm");


> I can make these edits when applying, if/when we get to applying. Let me
> continue reading.
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
